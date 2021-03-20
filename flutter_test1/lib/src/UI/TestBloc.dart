import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test1/src/blocs/Testblocs.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class TestBloc extends StatefulWidget {
  @override
  _TestBlocState createState() => _TestBlocState();
}

class _TestBlocState extends State<TestBloc> {
  TextEditingController incre = new TextEditingController();
  TextEditingController decre = new TextEditingController();

  BlocTest bloc = new BlocTest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('test Bloc'),
        ),
        body: KeyboardDismisser(
            child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 20),
                      child: StreamBuilder(
                          stream: bloc.OutputStream,
                          initialData: 30,
                          builder: (context, snapshot) => Text(
                                snapshot.data.toString(),
                                style: TextStyle(fontSize: 25),
                              )),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100, left: 100),
                          child: TextField(
                            controller: incre,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1)),
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 50),
                            child: GestureDetector(
                              child: IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    bloc.InputController.sink.add(Increment(incre.text));
                                  }),
                            )),
                      ],
                    ),
                    Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 100, left: 100),
                          child: TextField(
                            controller: decre,
                            keyboardType: TextInputType.number,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 50),
                            child: GestureDetector(
                                child: IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () {
                                      bloc.InputController.sink.add(Decrement(decre.text));
                                    }),
                        )),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          bloc.InputController.sink.add(Reset());
                        },
                        child: Text('Reset'))
          ],
        ))));
  }
}
