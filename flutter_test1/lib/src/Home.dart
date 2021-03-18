import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Drawer.dart';

class Home extends StatefulWidget{
  Home({Key key}) : super(key: key);

  @override
  _Home createState() =>  _Home();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('Home',style: TextStyle(color: Colors.black),),
       leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.black,
          onPressed: () {
            scaffoldKey.currentState.openDrawer();
          }
        ),
      ),
      drawer: DrawerScreen(),
    );
  }

}
