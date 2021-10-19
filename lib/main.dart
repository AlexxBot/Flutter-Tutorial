import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/calculadora_bloc/calculadora_bloc.dart';
import 'package:flutter_tutorial/models/raza.dart';
import 'package:flutter_tutorial/pages/calculadora-bloc-page.dart';
import 'package:flutter_tutorial/pages/calculadora-page.dart';
import 'package:flutter_tutorial/pages/cats/catList-page.dart';
import 'package:flutter_tutorial/pages/counterPage.dart';
import 'package:flutter_tutorial/pages/detail-page.dart';
import 'package:flutter_tutorial/pages/keys/key-page.dart';
import 'package:flutter_tutorial/pages/list-page.dart';
import 'package:flutter_tutorial/pages/loginPage.dart';
import 'package:flutter_tutorial/provider/calculadora-provider.dart';
import 'package:flutter_tutorial/services/raza-service.dart';
import 'package:provider/provider.dart';

import 'bloc/cat_bloc/cat_bloc.dart';

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
        //theme: ThemeData.dark(),
        //theme: ThemeData.light(),
        theme: ThemeData(
          accentColor: Colors.blueAccent,
          primaryColor: Colors.blue,
        ),
        title: 'Flutter Demo',
        //home: HomeStateful(),
        initialRoute: '/keyPage',
        routes: {
          '/': (context) => LoginPage(),
          '/listPage': (context) => ListPage(),
          '/detalle': (context) => DetailPage(),
          '/cats': (context) => BlocProvider(
                create: (_) => CatBloc(razaService: RazaService()),
                child: CatListPage(),
              ),
          '/calculadora': (context) => ChangeNotifierProvider(
              create: (_) => CalculadoraProvider(), child: CalculadoraPage()),
          '/calculadoraBloc': (context) => BlocProvider(
                create: (_) => CalculadoraBloc(),
                child: CalculadoraBlocPage(),
              ),
          '/counter': (context) => CounterPage(),
          '/keyPage': (_) => KeyPage()
        });
  }
}

//un stateless widget solo se pinta una vez
/* class HomeStateless extends StatelessWidget {
  //todo lo que este aqui se define una vez, porque es el contructor
  final String title;
  final double valorAltura;
  HomeStateless({this.title = "valor inicial", this.valorAltura = 50});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: /* Icon(Icons.arrow_back) */ Center(child: Text("leading")),
          title: Text(
            "Titulo",
            style: TextStyle(fontSize: 25, color: Colors.amber),
          ),
          elevation: 10,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.red),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          /* leadingWidth: 100,
          toolbarHeight: 100,
          toolbarOpacity: 0.5, */
        ),

        //actions: [IconButton(icon: Icon(Icons.search), onPressed: () => ejecutarBusqueda())],

        body: /* Column( */
            //widget limitado por alto y ancho
            ListView(
          scrollDirection: Axis.vertical,
          //con este widget se puede hacer scroll
          children: [
            Container(
              height: 140,
              //width: 200,
              color: Colors.black,
            ),
            Container(
              height: 140,
              //width: 200,
              color: Colors.white,
            ),
            Container(
              height: valorAltura,
              //width: 200,
              color: Colors.brown,
            ),
            Text("texto hijo"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.amberAccent,
                  height: 50,
                  width: 50,
                ),
                Container(
                  color: Colors.green,
                  height: 20,
                  width: 20,
                ),
                Container(
                  color: Colors.cyan,
                  height: 50,
                  width: 50,
                )
              ],
            ),
            Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    //color: Colors.amberAccent,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amberAccent),
                  ),
                  Container(
                    color: Colors.green,
                    height: 20,
                    width: 20,
                  ),
                  Container(
                    color: Colors.cyan,
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            )
          ],
        )
        /* Container(
        child: Center(
            child: Text(title,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.red,
                    fontWeight: FontWeight.bold))),
      ), */
        );
  }
} */

class HomeStateful extends StatefulWidget {
  //todo lo que este aqui se define una vez, porque es el contructor
  final String title;
  final double altura;
  HomeStateful({this.title = "valor inicial stateful", this.altura = 0});
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  String titleParametro = '';
  double valorAltura = 0;

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
    this.valorAltura = widget.altura;
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
        onPressed: /* agregarHijos(hijosString.length + 1) */ moverAHijo,
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

class NietoWidget extends StatefulWidget {
  @override
  _NietoWidgetState createState() => _NietoWidgetState();
}

class _NietoWidgetState extends State<NietoWidget> {
  void volver() {
    Navigator.pop(context, "volver al padre");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: MaterialButton(
          child: Text("REGRESAR AL NODO RAIZ"),
          onPressed: volver,
        ),
      ),
    );
  }
}
/* 
class Widgets extends StatefulWidget {
  @override
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _focusNodeEdad = FocusNode();
  //double valorAltura;
  TextEditingController _nombreController;
  TextEditingController _passwordController;
  TextEditingController _edadController;
  TextEditingController _lugarController;

  /* String nombreController;
  String passwordController; */

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //valorAltura = 50;
    _nombreController = TextEditingController(text: "alex");
    _passwordController = TextEditingController();
    _edadController = TextEditingController(text: "0");
    _lugarController = TextEditingController();
    /* nombreController = 'alex';
    passwordController = ''; */

    _focusNodeEdad.addListener(() {
      if (_focusNodeEdad.hasFocus) {
        print("el controlador de edad tiene el foco");
        if (int.parse(_edadController.text) > 100) {
          _edadController.text = "0";
        }
      } else {
        print(" el controlador perdio el foco");
      }
    });
  }

  void _subirFormulario() {
    /* print('nombre : ${_nombreController.text}');
    print('password : ${_passwordController.text}'); */

    final FormState formularioState = _formKey.currentState;

    if (formularioState.validate()) {
      formularioState.save();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text("formulario correcto")));
      print("el formulario se subio correctamente");
    } else {
      print("el formulario tiene errores");
    }
  }

  /* void modificarAltura() {
    setState(() {
      if (valorAltura == 50)
        valorAltura = 100;
      else {
        valorAltura = 50;
      }
    });
  } */

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //top: true,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Formulario"),
          actions: [
            /* IconButton(icon: Icon(Icons.face), onPressed: modificarAltura) */
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            shape: RoundedRectangleBorder(
              //side: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            elevation: 20,
            child: Form(
                key: _formKey,
                child: Scrollbar(
                  hoverThickness: 10,
                  thickness: 10,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: "Nombre",
                            /* hintText: "nombre hint",
                          helperText: "texto de ayuda",
                          helperStyle: TextStyle(color: Colors.red), */
                            border: OutlineInputBorder(),
                            /* enabledBorder: OutlineInputBorder() */
                          ),
                          controller: _nombreController,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscuringCharacter: "*",
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Contrasenia",
                            /* hintText: "nombre hint",
                          helperText: "texto de ayuda",
                          helperStyle: TextStyle(color: Colors.red), */
                            border: OutlineInputBorder(),
                            /* enabledBorder: OutlineInputBorder() */
                          ),
                          controller: _passwordController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextField(
                          decoration: InputDecoration(labelText: "edad"),
                          controller: _edadController,
                          focusNode: _focusNodeEdad,
                          keyboardType: TextInputType.number,
                          //inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^[a-zA-Z0-9]+$'))],
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          //readOnly: true,
                          /* onChanged: (String valor) {
                            //va
                            print("se cambio el valor de edad por :" + valor);
                          }, */
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "lugar nacimiento"),
                          controller: _lugarController,
                          onChanged: (String valor) {
                            //va
                            print("se cambio el valor de edad por :" + valor);
                          },
                          validator: (valor1) => valor1.length > 10
                              ? "el valor no es valido"
                              : null,
                          onSaved: (valor) {
                            print('entro al onsaved');
                          },
                        ),
                      )
                    ],
                  ),
                )),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload_file),
          onPressed: _subirFormulario,
        ),
      ),
    );
  }
}
 */
