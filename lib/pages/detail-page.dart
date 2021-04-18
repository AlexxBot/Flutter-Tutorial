import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  _regresar() {
    //Navigator.pop(context);
    //Navigator.of(context).pop();
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _regresar,
        ),
        /* actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _regresar,
          )
        ], */
      ),
      body: Column(),
    );
  }
}
