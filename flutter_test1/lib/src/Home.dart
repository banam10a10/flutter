import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      drawer:Drawer(

        child: ListView(
          children:<Widget> [
              Row(
                children: [
                  Image.asset('assets/teamwork.png',width: 150),
                   Container(
                     child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Username',style: TextStyle( fontSize: 16),),
                          ),
                          Text('Fullname',style: TextStyle( fontSize: 16),),
                        ],
                      ),
                   ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Center(
                child: Text('email@email.com',style:TextStyle(fontSize: 18)),
              ),
            ),
            Center(
              child: Text('0987654321',style:TextStyle(fontSize: 18)),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Đăng xuất',style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),),
              onTap: (){Navigator.pushNamed(context,'/login');},
            ),
          ],
        ),
      )
    );
  }

}
