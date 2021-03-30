import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test1/src/blocs/Send_form_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class TakeLeave extends StatefulWidget {
  TakeLeave({Key key, this.remain}) : super(key: key);
  final int remain;

  @override
  _TakeLeaveState createState() => _TakeLeaveState();
}

class _TakeLeaveState extends State<TakeLeave> {
  String ChoosenValue = 'Ngày';

  DateTime PickDate;
  SendFormBloc Bloc = new SendFormBloc();

  TextEditingController NumOff = new TextEditingController();
  TextEditingController ReasonOff = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PickDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
        child:
            Stack(alignment: AlignmentDirectional.topStart, children: <Widget>[
      Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: null,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ngày bắt đầu:',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                            width: 250,
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black38,
                                width: 1,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              onPressed: () => ChooseDate(context),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  '${PickDate.day}/${PickDate.month}/${PickDate.year}',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                    StreamBuilder(
                        stream: Bloc.NumOffs.stream,
                        builder: (context, snapshot) => Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 30),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Số ngày nghỉ:',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 75,
                                      height: 40,
                                      child: TextField(
                                        controller: NumOff,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.digitsOnly
                                        ],
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: snapshot.hasError? Colors.red : Colors.black, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: snapshot.hasError? Colors.red : Colors.black, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black38,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: DropdownButton(
                                        value: ChoosenValue,
                                        underline: SizedBox(),
                                        onChanged: (newValue) {
                                          setState(() {
                                            ChoosenValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Ngày',
                                          'Nửa Ngày'
                                        ].map<DropdownMenuItem>((String value) {
                                          return DropdownMenuItem(
                                              value: value,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 40, right: 30),
                                                child: Text(value),
                                              ));
                                        }).toList(),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(padding: EdgeInsets.only(left: 120,top:5),
                                    child: snapshot.hasError? Text(snapshot.error,style: TextStyle(color: Colors.red),):null,
                                    )
                                  ],
                                )
                              ],
                            ))),
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
                        child: StreamBuilder(
                      stream: Bloc.ReasonOffs.stream,
                      builder: (context, snapshot) => TextField(
                        controller: ReasonOff,
                        maxLines: 7,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            errorText:
                                snapshot.hasError ? snapshot.error : null,
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    )),
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 10),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 50,
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
                              width: 50,
                            ),
                            SizedBox(
                              height: 50,
                              width: 100,
                              child: ElevatedButton(
                                onPressed: () => Send(),
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
              ))),
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
    ]));
  }

  ChooseDate(BuildContext context) async {
    DateTime datePicked = await showDatePicker(
      context: context,
      helpText: 'Chọn ngày bắt đầu nghỉ:',
      cancelText: 'Thoát',
      initialDate: PickDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (datePicked != null) {
      setState(() {
        PickDate = datePicked;
      });
    }
  }

  Send() {
    if (Bloc.CanSend(NumOff.text, ReasonOff.text, widget.remain)) {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Gửi thành công'),
                content: Icon(
                  Icons.verified_user_outlined,
                  size: 50,
                  color: Colors.green,
                ),
              ));
    }
  }
}
