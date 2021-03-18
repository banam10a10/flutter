import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Image.asset('assets/teamwork.png', width: 150),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Username',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Text(
                      'Fullname',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Center(
              child: Text('email@email.com', style: TextStyle(fontSize: 18)),
            ),
          ),
          Center(
            child: Text('0987654321', style: TextStyle(fontSize: 18)),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text(
              'Nhân viên',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/Staff');
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              'Đăng xuất',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
