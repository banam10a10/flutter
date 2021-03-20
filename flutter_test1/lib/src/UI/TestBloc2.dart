import 'package:flutter/material.dart';
import 'package:flutter_test1/src/blocs/blocs2.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class Bloc2 extends StatefulWidget {
  @override
  _Bloc2State createState() => _Bloc2State();
}

class _Bloc2State extends State<Bloc2> {

  TextEditingController InputController = new TextEditingController();
  Blocs2 blocs = new Blocs2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: KeyboardDismisser(
        child: SingleChildScrollView(
          child:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                height: 600,
                child:StreamBuilder(
                    stream : blocs.OutputStream,
                    builder:(context,snapshot)=>ListView.builder(
                      itemCount: Blocs2.Mess.length,
                      itemBuilder:(context, index) => ListTile(
                        title: Text('${Blocs2.Mess[index]}'),  
                      ),
                    )) ,
              ),
                Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    TextField(
                      controller: InputController,
                      decoration:InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          )
                      ),
                    ),
                    GestureDetector(
                      child: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){
                          blocs.input.sink.add(InputController.text);
                        },
                      ),
                    ),


                  ],
                ),
              ],
          ),)
        ),
      ) ,
    );
  }
}
