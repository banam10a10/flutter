import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test1/src/Drawer.dart';
import 'package:flutter_test1/src/UI/DetailsOff.dart';
import 'package:flutter_test1/src/UI/TakeLeave.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class day_off extends StatefulWidget {
  @override
  _day_offState createState() => _day_offState();
}

var scaffoldKey = GlobalKey<ScaffoldState>();

class _day_offState extends State<day_off> {

  int Remain = Remaining();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child: Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Quản lý nghỉ phép',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            }),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none),
              iconSize: 40,
              color: Colors.lightBlueAccent,
              onPressed: () {})
        ],
      ),
      drawer: DrawerScreen(),
      body: Container(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: 400,
                height: 200,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            'Tổng số ngày nghỉ:',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 100, top: 5, right: 100),
                          child: Text(
                            '12',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Số ngày còn lại:',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 125),
                            child: Text(
                              '${Remain}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Text(
                            'Nội quy công ty:',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Mỗi thành viên trong công ty chỉ được nghỉ 12 ngày phép/năm và mỗi ngày nghỉ không quá 4 ngày trừ trường hợp có lý do đặc biệt.',
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      'Lịch sử nghỉ phép',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )),
            Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 350,
                  child: ListView.builder(
                      itemCount: dataOff.length,
                      itemBuilder: (context, index) => ListTile(
                          leading: Icon(
                            Icons.account_circle_rounded,
                            size: 50,
                          ),
                          trailing: dataOff[index].confirm
                              ? Icon(
                                  Icons.verified_outlined,
                                  color: Colors.green,
                                  size: 50,
                                )
                              : Icon(Icons.close, color: Colors.red, size: 50),
                          title: Text(
                            '${dataOff[index].date.day}/${dataOff[index].date.month}/${dataOff[index].date.year} - ${dataOff[index].num} (ngày)',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsOff(index: index)))
                      )),
                )),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 50,
                width: 125,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TakeLeave(remain: Remain))),
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    backgroundColor: Color.fromARGB(1000, 5, 94, 47),
                  ),
                  child: Text('Xin nghỉ'),
                )),
          ],
        )),
      ),
    ));
  }

}

/*Details(context, index) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Center(
                child: Text(
              'Xin nghỉ phép',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
            content: Container(
              height: 500,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ngày bắt đầu:',
                        style: TextStyle(fontSize: 16),
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 75),
                          child: Text(
                            '${dataOff[index].date.day}/${dataOff[index].date.month}/${dataOff[index].date.year}',
                            style: TextStyle(fontSize: 16),
                          )),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            'Số ngày nghỉ:',
                            style: TextStyle(fontSize: 16),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 90),
                              child: Text(
                                '${dataOff[index].num} ngày',
                                style: TextStyle(fontSize: 16),
                              )),
                        ],
                      )),
                  Row(
                    children: [
                      Text(
                        'Lý do xin nghỉ:',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${dataOff[index].reasonOff}',
                        ),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'Lý do từ chối:',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 350,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          '${dataOff[index].reasonRefuse}',
                        ),
                      ))
                ],
              ),
            ),
            actions: [
              SizedBox(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Color.fromARGB(1000, 148, 17, 17),
                  ),
                  child: Text(
                    'Thoát',
                  ),
                ),
              ),
            ],
          ));
}

TakeLeaves(context) {
  return showDialog(
      context: context,
      builder: (context) => KeyboardDismisser(
              child: AlertDialog(
            title: Center(
                child: Text(
              'Xin nghỉ phép',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            )),
            content: Container(
              height: 350,
              width: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Ngày bắt đầu:',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Text(
                            'Số ngày nghỉ:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )),
                  Row(
                    children: [
                      Text(
                        'Lý do xin nghỉ:',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor:
                                    Color.fromARGB(1000, 148, 17, 17),
                              ),
                              child: Text(
                                'Hủy',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor:
                                    Color.fromARGB(1000, 13, 209, 219),
                              ),
                              child: Text(
                                'Gửi',
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          )));

}
*/

class Data {
  DateTime date;
  int num;
  bool confirm;
  String reasonOff;
  String reasonRefuse;

  Data({this.date, this.num, this.confirm, this.reasonOff, this.reasonRefuse});


}

Remaining(){
  int Remain=12;
  for(var i in dataOff){
    if(i.confirm){
      Remain -= i.num;
    }
  }
  return Remain;
}


final List<Data> dataOff = [
  Data(
    date: DateTime(2020, 10, 8),
    num: 1,
    confirm: false,
    reasonOff: 'Thích thì nghỉ',
    reasonRefuse: 'GOOD JOB'
  ),
  Data(
    date: DateTime(2020, 10, 7),
    num: 2,
    confirm: true,
    reasonOff: 'Vui thì nghỉ',
  ),
  Data(
    date: DateTime(2020, 1, 23),
    num: 4,
    confirm: false,
    reasonOff: 'Trời mưa',
    reasonRefuse: 'Bướng',
  ),
];
