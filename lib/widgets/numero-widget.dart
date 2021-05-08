import 'package:flutter/material.dart';

class NumeroWidget extends StatefulWidget {
  final String numero;
  final VoidCallback asignarNumero;
  final Color? color;
  final bool fullwidth;

  NumeroWidget(
      {Key? key,
      required this.numero,
      required this.asignarNumero,
      this.color,
      this.fullwidth = false})
      : super(key: key);
  @override
  _NumeroWidgetState createState() => _NumeroWidgetState();
}

class _NumeroWidgetState extends State<NumeroWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.asignarNumero,
      child: Material(
        elevation: 10,
        child: Container(
          decoration: BoxDecoration(
              color: widget.color == null
                  ? Theme.of(context).primaryColor
                  : widget.color,
              border: Border.all(color: Colors.white, width: 3)),
          //color: Theme.of(context).primaryColor,
          height: 100,
          width: widget.fullwidth
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.width / 4,
          child: Center(
              child: Text(
            widget.numero,
            style: TextStyle(fontSize: 30, color: Colors.white),
          )),
        ),
      ),
    );
  }
}
