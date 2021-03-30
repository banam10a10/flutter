import 'package:flutter/material.dart';
import 'package:flutter_test1/src/Home.dart';
import 'package:flutter_test1/src/UI/LoginPage.dart';
import 'package:flutter_test1/src/UI/RegisterPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/login',
      routes:{
        '/login' : (context) => LoginPage(title: 'Login Page',),
        '/Register': (context) => RegisterPage(),
        '/home' :(context) => Home(),
      },
    );
  }
}


