import 'dart:async';

//import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// STEP1:  Stream setup
class CounterSocket {
  final _socketResponse = StreamController<String>();

  void Function(String) get addResponse => _socketResponse.sink.add;

  Stream<String> get getResponse => _socketResponse.stream;

  /* sendMessage(String contador) {
    _socketResponse.sink.add(contador);
  } */

  void dispose() {
    _socketResponse.close();
  }
}

CounterSocket streamSocket = CounterSocket();

//STEP2: Add this function in main function in main.dart file and add incoming data to the stream
void connectAndListen() {
  IO.Socket socket = IO.io(
      'http://10.0.3.2:4000',
      /* <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': false
  } */
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build());

  //print('se conecto');
  socket.connect();
  socket.onConnect((data) {
    print('connect');
    //socket.emit('sendContador', '2');
  });
  socket.on('connect', (_) {
    print('connect');
  });
  if (socket.connected) {
    //socket.emit('sendContador', "2");
  }

  //When an event recieved from server, data is added to the stream
  socket.on('sendContador', (data) => streamSocket.addResponse(data));
  socket.onDisconnect((_) => print('disconnect'));
}
