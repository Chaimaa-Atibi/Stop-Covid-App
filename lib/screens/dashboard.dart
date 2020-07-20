import 'package:covid_test_app/model/countries.dart';
import 'package:covid_test_app/model/covid19_dashboard.dart';
import 'package:covid_test_app/services/networking.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/country.dart';
import 'package:covid_test_app/services/search_delegate.dart';
import 'package:covid_test_app/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  Covid19Dashboard data;
  List<Covid19Dashboard> dataHistory;
  AnimationController _controller;
  Animation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    dataHistory = [];
    _controller = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('COVID-19 Tracker'),
          backgroundColor: Colors.blueGrey,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: OurSearchDelegate(
                        countriesList: data.countries.toList()));
              },
            )
          ],
        ),
        body: data == null
            ? Center(child: CircularProgressIndicator())
            : RefreshIndicator(
                onRefresh: getData,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverGrid(
                        delegate: SliverChildListDelegate([
                          buildSummaryCard(
                              text: 'Confirmed',
                              color: Colors.black,
                              count: data.confirmed),
                          buildSummaryCard(
                              text: 'Active',
                              color: Colors.blue,
                              count: data.active),
                          buildSummaryCard(
                              text: 'Recovered',
                              color: Colors.green,
                              count: data.recovered),
                          buildSummaryCard(
                              text: 'Deaths',
                              color: Colors.red,
                              count: data.deaths),
                        ]),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                        )),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child:
                              Center(child: Text('Result Date: ${data.date}')),
                        )
                      ]),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          var item = data.countries[index];
                          return buildExpansionTile(item, index);
                        },
                        childCount: data.countries.length,
                      ),
                    )
                  ],
                )
                ));
  }

  Future<void> getData() async {
    Networking network = Networking();
    Covid19Dashboard result = await network.getDashboardData();
    List<Covid19Dashboard> resultHistory = await network.getDashboardHistoryData();
    setState(() {
      data = result;
      dataHistory = resultHistory;
      print(dataHistory);
      if (data != null) {
        _controller.reset();
        _controller.forward();
      }
    });
  }

  final formatter = NumberFormat.decimalPattern('en-US');

  Widget buildDetailText({int count, Color color, String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        '$text: ${formatter.format(count)}',
        style: TextStyle(color: color),
      ),
    );
  }

  Widget buildExpansionTile(Countries item, int index) {
    return ListTile(
      leading: item.countryCode.length == 2
          ? CountryPickerUtils.getDefaultFlagImage(
              Country(isoCode: item.countryCode))
          : Text(''),
      title: Text('${item.country}'),
      trailing: Text('${formatter.format(item.confirmed)}'),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CountryScreen(country: item,),
        ),
      ),
    );
  }

  Widget buildSummaryCard({int count, Color color, String text}) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(_curvedAnimation),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                text,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${formatter.format(count)}',
                style: TextStyle(
                    color: color, fontWeight: FontWeight.bold, fontSize: 22),
              )
            ],
          ),
        ),
      ),
    );
  }
}
