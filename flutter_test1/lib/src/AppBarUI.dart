import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/src/Drawer.dart';

class AppBarUI extends StatefulWidget {

  AppBarUI({Key key,this.title}) : super(key:key);
  final String title;

  @override
  _AppBarUIState createState() => _AppBarUIState();
}

class _AppBarUIState extends State<AppBarUI> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('',),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){ScaffoldKey.currentState.openDrawer();},
        ),
      ),
      drawer: DrawerScreen(),
    );
  }
}
