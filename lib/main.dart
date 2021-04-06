import 'package:flutter/material.dart';

void main() {
  print('se ejecuto el main');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeStateful(),
    );
  }
}

//un stateless widget solo se pinta una vez
class HomeStateless extends StatelessWidget {
  //todo lo que este aqui se define una vez, porque es el contructor
  final String title;
  HomeStateless({this.title = "valor inicial"});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
            child: Text(title,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}

class HomeStateful extends StatefulWidget {
  //todo lo que este aqui se define una vez, porque es el contructor
  final String title;
  HomeStateful({this.title = "valor inicial stateful"});
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  String titleParametro;

  List<Widget> hijos = [];
  List<String> hijosString = [];
  //
  //List<int> enteros;

  //List<Widget> hijos;

  void sePresiono() {
    print('se presiono');
    titleParametro = "valor presionado";
    print(titleParametro);

    setState(() {});
  }

  void agregarHijos(int indice) {
    setState(() {
      //hijos.add(Text('segundo hijo'));
      hijosString.add(indice.toString());
    });
  }

  void moverAHijo() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HijoWidget()),
    ).then((value) => setState(() => titleParametro = value));
  }

  @override
  void initState() {
    // TODO: implement initState
    //esto metodo se ejecuta cuando se inicio el widget
    super.initState();
    titleParametro = "valor parametro";
    //hijos.add(Text("hola"));
    //hijos.add(Text("hola 2"));
    print(hijos.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleParametro),
      ),
      body:
          /* Column(
        //scrollDirection: Axis.vertical,
        children: hijos,
      ), */
          ListView.builder(
        itemBuilder: (context, i) {
          return Text(hijosString[i]);
        },
        itemCount: hijosString.length,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        child: Text(hijosString.length.toString()),
        onPressed:
            () => /* agregarHijos(hijosString.length + 1) */ moverAHijo(),
      ),
    );
    /* Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
            child: Text(titleParametro,
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarm),
        onPressed: () => sePresiono(),
      ),
    ); */
  }
}

class HijoWidget extends StatefulWidget {
  @override
  _HijoWidgetState createState() => _HijoWidgetState();
}

class _HijoWidgetState extends State<HijoWidget> {
  void volver() {
    Navigator.pop(context, "desde el hijo");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('el ciclo de vida del hijo termino');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Text("hijo"),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.backpack),
        onPressed: volver,
      ),
    );
  }
}
