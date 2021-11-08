import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theme_mode_switch/notify.dart';

void main() {
  runApp(
      ChangeNotifierProvider(create: (context) => DarkMode(), child: MyApp()));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thmode = Provider.of<DarkMode>(context); ///accessing the variable of provider class
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dark Mode',
      theme: ThemeData(
        ///here the value of darmode var is updationg by switching
        brightness: thmode.darkMode ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {      
    final thmode = Provider.of<DarkMode>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Dark Mode'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(thmode.darkMode ? 'Dark' :'Light'),
              CupertinoSwitch(
                value: thmode.darkMode,
                onChanged: (bool val) {
                  thmode.changemode();
                },
              ),
            ],
          ),
        ));
  }
}
