

import 'package:flutter/material.dart';

import '../Drawer.dart';

class StaffPage extends StatefulWidget {
  StaffPage({Key key}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  var Key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Nhân viên',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Key.currentState.openDrawer();
            }),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications_none_outlined,
            ),
            color: Colors.lightBlueAccent,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert_outlined),
            color: Colors.black,
            onPressed: () {},
          )
        ],
      ),
      drawer: DrawerScreen(),
    );
  }

  List<dynamic> staff = Data;

  static const Data = [
    {
      'name':'Nguyễn Văn A',
      'date':'20-12-2020',
      'team':'1',
    },
    {
      'name':'Nguyễn Văn B',
      'date':'22-12-2020',
      'team':'2',
    },
    {
      'name':'Nguyễn Văn C',
      'date':'12-12-2020',
      'team':'3',
    },
  ];
/*
  List<Widget> StaffData = [];
  void PostData(){
    List<dynamic> resList = Data;
    List<Widget> listStaff = [];
    resList.forEach((element){
      listStaff.add(Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.account_circle_outlined),
            Text(element['name'] + ' - ' + element['date'],style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ));
    });
    setState(() {
      StaffData = listStaff ;
    });
  }
*/
}

