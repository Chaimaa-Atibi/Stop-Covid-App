import 'package:covid_test_app/model/countries.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:covid_test_app/model/covid19_dashboard.dart';
import 'package:syncfusion_flutter_core/core.dart';

class CountryScreen extends StatelessWidget {
  final formatter = NumberFormat.decimalPattern('en-US');
  final Countries country;

  final List<Covid19Dashboard> historyData = [];
  CountryScreen({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.country),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.network(
              'https://www.countryflags.io/${country.countryCode}/flat/64.png',
              width: MediaQuery.of(context).size.width / 3,
              fit: BoxFit.fill,
            ),
          ),
          buildDetailText(
              count: country.confirmed, color: Colors.black, text: 'Confirmed'),
          buildDetailText(
              count: country.active, color: Colors.blue, text: 'Active'),
          buildDetailText(
              count: country.recovered, color: Colors.green, text: 'Recovered'),
          buildDetailText(
              count: country.deaths, color: Colors.red, text: 'Deaths'),
        ],
      ),
      ),
    );
  }

  Widget buildDetailText({int count, Color color, String text}) {
    return ListTile(
      title: Text('$text',
          style: TextStyle(color: color, fontWeight: FontWeight.bold)),
      subtitle: Text('${formatter.format(count)}'),
    );
  }
}

class ChartItem {
  ChartItem(this.date, this.count);

  final String date;
  final double count;
}
