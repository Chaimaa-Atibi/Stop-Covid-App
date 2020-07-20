import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:covid_test_app/model/countries.dart';
import 'package:covid_test_app/screens/country_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OurSearchDelegate extends SearchDelegate {
  final List<Countries> countriesList;
  final formatter = NumberFormat.decimalPattern('en-US');

  OurSearchDelegate({this.countriesList});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear_all),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView(
      children: countriesList
          .where((element) =>
          element.country.toLowerCase().contains(query.toLowerCase()))
          .map<Widget>(
            (e) => ListTile(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CountryScreen(country: e,),
            ),
          ),
          leading: e.countryCode.length == 2
              ? CountryPickerUtils.getDefaultFlagImage(
              Country(isoCode: e.countryCode))
              : Text(''),
          title: Text(e.country),
          subtitle: Text('${formatter.format(e.confirmed)}'),
        ),
      )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: countriesList
          .where((element) =>
              element.country.toLowerCase().contains(query.toLowerCase()))
          .map<Widget>(
            (e) => ListTile(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CountryScreen(country: e,),
                ),
              ),
              leading: e.countryCode.length == 2
                  ? CountryPickerUtils.getDefaultFlagImage(
                      Country(isoCode: e.countryCode))
                  : Text(''),
              title: Text(e.country),
              subtitle: Text('${formatter.format(e.confirmed)}'),
            ),
          )
          .toList(),
    );
  }
}
