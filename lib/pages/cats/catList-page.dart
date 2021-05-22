import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/bloc/cat_bloc/cat_bloc.dart';
import 'package:flutter_tutorial/models/raza.dart';
import 'package:flutter_tutorial/services/raza-service.dart';

class CatListPage extends StatefulWidget {
  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  List<Raza> razaGatos = [];
  final razaService = RazaService();

  String? cadenaNula; //puede ser nulo
  String cadenaNoNula = "algo";

  late Future<List<Raza>> razaGatosFuture;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late final CatBloc catBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /* print("antes de llamar a la funcion");
    //es asincrono
    razaService.getBreads().then((lista) => setState(() {
          razaGatos = lista;// se asigna cuando la respuesta ya se obtuvo
          print("se asigno la lista");
        }));
    print("despues de llamar la funcion"); */
    //
    //razaGatosFuture = razaService.getBreads();
    //par conevertir de una valor posiblemente nulo a uno nu nulo
    //
    //cadenaNula = "nuevo valor";
    //cadenaNoNula = cadenaNula!;
    //print(cadenaNoNula);
    catBloc = BlocProvider.of<CatBloc>(context);

    //
    catBloc.add(ListarGatos());
  }

  Widget syncBody() {
    return Scrollbar(
      thickness: 10,
      isAlwaysShown: true,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: razaGatos.length,
            itemBuilder: (context, index) {
              return Card(
                  elevation: 10,
                  //color: index % 2 == 0 ? Colors.green : Colors.blue,
                  child: Stack(children: [
                    Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop),
                                image: NetworkImage(
                                  razaGatos[index].imagen.url,
                                )))),
                    /* Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Image.network(
                          razaGatos[index].imagen.url,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ), */
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        razaGatos[index].nombre,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]));
            }),
      ),
    );
  }

  Widget asyncBody() {
    return FutureBuilder<List<Raza>>(
      future: razaGatosFuture,
      builder: (context, AsyncSnapshot<List<Raza>> snapshot) {
        if (snapshot.hasData) {
          /* return ListView.builder(
              itemBuilder: (context, index) {
                /* return Text(snapshot.data![index].imagen.url); */
                return Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.8),
                                BlendMode.dstATop),
                            image: NetworkImage(snapshot.data![index].imagen.url
                                /* snapshot.data![index].imagen.url, */
                                ))));
              },
              itemCount: snapshot.data!.length); */
          return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 1 / 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 10,
                    //color: index % 2 == 0 ? Colors.green : Colors.blue,
                    child: Stack(children: [
                      Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.8),
                                      BlendMode.dstATop),
                                  image: NetworkImage(
                                    snapshot.data![index].imagen.url,
                                  )))),
                      /* Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Image.network(
                          razaGatos[index].imagen.url,
                          fit: BoxFit.fill,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          },
                        ),
                      ), */
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          snapshot.data![index].nombre,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]));
              });
        } else {
          return Center(
              child:
                  CircularProgressIndicator() /* Text(
                  "los datos estan cargando") */
              );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(
            "Razas de Gatos " + context.watch<CatBloc>().nroGatos.toString(),
          ),
          actions: [],
        ),
        //body: asyncBody() /* syncBody() */);

        body: BlocListener<CatBloc, CatState>(
          listener: (context, state) {
            if (state is GatosListados) {
              _scaffoldKey.currentState!.showSnackBar(SnackBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  content: Text("Datos recuperados")));
            }
          },
          child: BlocBuilder<CatBloc, CatState>(
            builder: (context, state) {
              if (state is GatosListados) {
                return Scrollbar(
                  thickness: 10,
                  isAlwaysShown: true,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 1 / 1,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: state.gatos.length,
                        itemBuilder: (context, index) {
                          return Card(
                              elevation: 10,
                              //color: index % 2 == 0 ? Colors.green : Colors.blue,
                              child: Stack(children: [
                                Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            colorFilter: ColorFilter.mode(
                                                Colors.black.withOpacity(0.8),
                                                BlendMode.dstATop),
                                            image: NetworkImage(
                                              state.gatos[index].imagen.url,
                                            )))),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    state.gatos[index].nombre,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ]));
                        }),
                  ),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ));
  }
}
