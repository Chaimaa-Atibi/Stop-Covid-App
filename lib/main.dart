import 'package:flutter/material.dart';
import 'package:covid_test_app/screens/dashboard.dart';
import 'package:covid_test_app/interfaces/welcome_screen.dart';
import 'package:covid_test_app/interfaces/registration.dart';
import 'package:covid_test_app/interfaces/nearby_interface.dart';
import 'package:covid_test_app/interfaces/login.dart';
import 'package:covid_test_app/bloc/global_bloc.dart';
import 'package:syncfusion_flutter_core/core.dart';
import 'package:provider/provider.dart';

void main() {
  SyncfusionLicense.registerLicense(
      'NT8mJyc2IWhia31ifWN9Z2FoYmF8YGJ8ampqanNiYmlmamlmanMDHmgwOzI6PjIyfTInOjE6YmpqaxM0PjI6P30wPD4=');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GlobalBloc>(create: (_) => GlobalBloc()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new HomeScreen(),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        NearbyInterface.id: (context) => NearbyInterface(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stop Covid-19'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child:
         Image(
          image: AssetImage('images/stopcovid.png'),
    ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/user.png'),
                ),
              ),
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.blueGrey, Colors.white])),
            ),
            ListTile(
                title: Text(
                  ' Covid Tracker',
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                }),
            ListTile(
                title: Text(
                  'Covid Tracer',
                  style: TextStyle(fontSize: 18),
                ),
                trailing:
                Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>
                          WelcomeScreen()));
                }),
          ],
        ),
      ),
    );
  }
}
