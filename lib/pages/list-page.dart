import 'package:flutter/material.dart';
import 'package:flutter_tutorial/models/numero.dart';
import 'package:flutter_tutorial/pages/detail-page.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late final List<Numero> lista;
  late List<Numero> listaBusqueda;
  final TextEditingController input = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lista = [
      Numero(1, 'uno'),
      Numero(2, 'dos'),
      Numero(3, 'tres'),
      Numero(4, 'cuatro'),
      Numero(5, 'cinco'),
      Numero(6, 'seis'),
      Numero(7, 'siete'),
      Numero(8, 'ocho'),
      Numero(9, 'nueve'),
      Numero(10, 'diez'),
      Numero(11, 'once'),
      Numero(12, 'doce'),
      Numero(13, 'trece'),
      Numero(14, 'catorce'),
      Numero(15, 'quince'),
      Numero(16, 'dieciseis')
    ];

    listaBusqueda = lista;
  }

  void irDetalle() {
    //Navigator.pushNamed(context, '/detalle');
    Navigator.of(context).pushNamed('/detalle');
  }

  void buscar() {
    setState(() {
      listaBusqueda = lista
          .where((elemento) => elemento.numeroLetras.indexOf(input.text) >= 0)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: 300,
          color: Colors.white,
          child: ListView(
            children: [
              MaterialButton(
                child: Text("Detalle"),
                onPressed: irDetalle,
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Lista"),
          actions: [],
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(alignment: Alignment(1.0, 1.0), children: [
                  TextField(
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    controller: input,
                  ),
                  IconButton(icon: Icon(Icons.search), onPressed: buscar)
                  /* GestureDetector(
                    child: Icon(Icons.search),
                    onTap: buscar,
                  ), */
                ]),
              ),
            ),
            Expanded(
              child: Card(
                margin: EdgeInsets.all(10),
                elevation: 10,
                child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: listaBusqueda.length,
                    itemBuilder: (context, index) {
                      return Container(
                          color: index % 2 == 0 ? Colors.green : Colors.blue,
                          child: Text(
                            listaBusqueda[index].numeroLetras,
                            style: TextStyle(fontSize: 30),
                          ));
                    }), /*  ListView.builder(
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: index % 2 == 0 ? Colors.green : Colors.blue,
                      /* leading: Container(
                        child: Text(
                          listaBusqueda[index].numeroEntero.toString(),
                          style: TextStyle(fontSize: 30),
                        ),
                      ), */
                      child: Text(
                        listaBusqueda[index].numeroLetras,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  itemCount: listaBusqueda.length,
                ), */
              ),
            ),
          ],
        ));
  }
}
