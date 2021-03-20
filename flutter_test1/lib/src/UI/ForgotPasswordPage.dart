import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget{
  ForgotPasswordPage({Key key}) : super(key: key);

  @override
  _ForgotPasswordPage createState() =>  _ForgotPasswordPage();
}

class _ForgotPasswordPage extends State<ForgotPasswordPage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: (text) {
                print("First text field: $text");
              },
            ),
            TextField(
              controller: myController,
            ),
          ],
        ),
      ),
    );
  }
}