import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Day_off.dart';

class DetailsOff extends StatefulWidget {
  DetailsOff({Key key, this.index}) : super(key: key);
  final int index;

  @override
  _DetailsOffState createState() => _DetailsOffState();
}

class _DetailsOffState extends State<DetailsOff> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Text(
              'Xin nghỉ phép',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Ngày bắt đầu:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Text(
                          '${dataOff[widget.index].date.day}/${dataOff[widget.index].date.month}/${dataOff[widget.index].date.year}',
                          style: TextStyle(fontSize: 18),
                        )),
                  ],
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          'Số ngày nghỉ:',
                          style: TextStyle(fontSize: 18),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 105),
                            child: Text(
                              '${dataOff[widget.index].num} ngày',
                              style: TextStyle(fontSize: 18),
                            )),
                      ],
                    )),
                Row(
                  children: [
                    Text(
                      'Lý do xin nghỉ:',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 350,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '${dataOff[widget.index].reasonOff}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                dataOff[widget.index].confirm?SizedBox() : Column(
                  children: [
                      Row(
                        children: [
                          Text(
                            'Lý do từ chối:',
                            style:
                            TextStyle(fontStyle: FontStyle.italic, fontSize: 18),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: 350,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${dataOff[widget.index].reasonRefuse}',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ))
                  ],
                )

              ],
            ),
          ),
        ),
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(top: 15, left: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
