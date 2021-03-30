import 'dart:async';

import 'package:flutter_test1/src/blocs/Testblocs.dart';

class SendFormBloc{

  StreamController NumOffs = new StreamController();
  StreamController ReasonOffs = new StreamController();

  bool CanSend(String NumOff,String ReasonOff,int Remain){
    var Num = toNumber.StringToNumber(NumOff);
    if( NumOff.isEmpty){
      NumOffs.sink.addError('Nhập số ngày nghỉ!!!');
      return false;
    }
    NumOffs.sink.add('');
    if(Num > Remain){
      NumOffs.sink.addError('Số ngày nghỉ vượt quá quy định!!!');
      return false;
    }
    NumOffs.sink.add('');
    print(ReasonOff);
    if(ReasonOff.isEmpty){
      ReasonOffs.sink.addError('Nhập lý do xin nghỉ!!!');
      return false;
    }
    ReasonOffs.sink.add('');
    return true;
  }


  void dispose(){
    ReasonOffs.close();
    NumOffs.close();
  }
}