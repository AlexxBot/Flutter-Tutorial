import 'package:flutter/material.dart';
import 'package:flutter_tutorial/reactivebloc/counter-bloc.dart';
import 'package:flutter_tutorial/socket/counter-socket.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  CounterBloc _counterBloc = CounterBloc(initialCount: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _counterBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('You have pushed the button this many times:'),
              new StreamBuilder(
                  stream: _counterBloc.counterObservable,
                  builder: (context, AsyncSnapshot<int> snapshot) {
                    return new Text(
                      '${snapshot.data}', /* style: Theme.of(context).textTheme.display1 */
                    );
                  }),
              Text("Este contador funciona con socket io"),
              StreamBuilder(
                stream: streamSocket.getResponse,
                builder: (context, AsyncSnapshot<String> snapshot) {
                  return Container(
                    child: Text(snapshot.data.toString()),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: new FloatingActionButton(
                    onPressed: _counterBloc.increment,
                    tooltip: 'Increment',
                    child: new Icon(Icons.add),
                  )),
              new FloatingActionButton(
                onPressed: _counterBloc.decrement,
                tooltip: 'Decrement',
                child: new Icon(Icons.remove),
              ),
              new FloatingActionButton(
                child: Icon(Icons.east),
                onPressed: () {
                  print('se presiono el boton');
                  connectAndListen();
                },
              )
            ]));
  }
}
