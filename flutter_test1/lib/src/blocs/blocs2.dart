import 'dart:async';

class Blocs2 {
  StreamController input = new StreamController();
  StreamController output = new StreamController();

  Stream get OutputStream => output.stream;

  static List<String> Mess = [];

  Blocs2() {
    input.stream.listen((event) {
      Mess.add(event);
      output.sink.add(event);
    });
  }

  void dispose() {
    input.close();
    output.close();
  }
}
