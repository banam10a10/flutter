import 'dart:async';

class BlocTest {
  int Num = 30;

  StreamController InputController = new StreamController<Input>();
  StreamController Output = new StreamController();

  Stream get InputStream => InputController.stream;

  Stream get OutputStream => Output.stream;

  BlocTest() {
    InputStream.listen((event) {
      if (event is Increment) {
        var i = toNumber.StringToNumber(event.increment);
        Num += i;
      } else if (event is Decrement) {
        var i = toNumber.StringToNumber(event.decrement);
        Num -= i;
      } else
        Num = 0;
      Output.sink.add(Num);
    });
  }

  void dispose() {
    InputController.close();
    Output.close();
  }
}

abstract class Input {}

class Increment extends Input {
  Increment(this.increment);

  final String increment;
}

class Decrement extends Input {
  Decrement(this.decrement);
  final String decrement;
}

class Reset extends Input {}

class toNumber {
  static StringToNumber(String string) {
    var sum = 0;
    var num = string.codeUnits.toList();
    for (var i in num) {
      i -= 48;
      sum = sum * 10 + i;
    }
    return sum;
  }
}
