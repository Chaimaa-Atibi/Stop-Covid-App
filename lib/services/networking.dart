import 'dart:convert';

import 'package:covid_test_app/model/covid19_dashboard.dart';
import 'package:covid_test_app/model/serializers.dart';
import 'package:http/http.dart' as http;

class Networking {
  Future<Covid19Dashboard> getDashboardData() async {
    Covid19Dashboard _dashBoardResult;
    var url = 'https://doh.saal.ai/api/live';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      dynamic data = jsonDecode(response.body);
      _dashBoardResult =
          serializers.deserializeWith(Covid19Dashboard.serializer, data);
    } else {
      throw Exception('Connection Error');
    }

    return _dashBoardResult;
  }

  Future<List<Covid19Dashboard>> getDashboardHistoryData() async {
    List<Covid19Dashboard> _dashBoardHistoryResult = [];
    var url = 'https://ksamj.github.io/json/covid-19/history.json';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      _dashBoardHistoryResult.addAll(list.map((e) =>
          serializers.deserializeWith(Covid19Dashboard.serializer, e)));
    } else {
      throw Exception('Connection Error');
    }

    return _dashBoardHistoryResult;
  }
}
