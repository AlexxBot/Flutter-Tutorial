import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/raza.dart';
import 'package:flutter_tutorial/services/raza-service.dart';

class CatListPage extends StatefulWidget {
  @override
  _CatListPageState createState() => _CatListPageState();
}

class _CatListPageState extends State<CatListPage> {
  List<Raza> razaGatos = [];
  final razaService = RazaService();

  //late Future<List<Raza>> razaGatosFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razaService.getBreads().then((lista) => setState(() => razaGatos = lista));
    //
    //razaGatosFuture = razaService.getBreads();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Razas de Gatos"),
        actions: [],
      ),
      body:
          /* FutureBuilder<List<Raza>>(
          future: razaGatosFuture,
          builder: (context, AsyncSnapshot<List<Raza>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.8),
                                    BlendMode.dstATop),
                                image: NetworkImage(
                                  snapshot.data?[index].imagen.url,
                                ))));
                  },
                  itemCount: snapshot.data?.length);
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ) */

          Scrollbar(
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
      ),
    );
  }
}
