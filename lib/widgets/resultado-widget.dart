import 'package:flutter/material.dart';
import 'package:flutter_tutorial/provider/calculadora-provider.dart';
import 'package:provider/provider.dart';

class ResultadoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      context.watch<CalculadoraProvider>().resultado.toString(),
      style: TextStyle(fontSize: 40),
    );
  }
}
