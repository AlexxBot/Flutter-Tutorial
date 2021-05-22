import 'package:flutter/cupertino.dart';

enum Operador { Sumar, Restar, Multiplicar, Dividir }
//clase que define valores contantes

class CalculadoraProvider extends ChangeNotifier {
  double resultado = 0;
  String numero1 = "";
  String numero2 = "";
  bool escribiendoNumero1 = true;
  Operador? operador;

  //CalculadoraProvider(this.res)

  operar() {
    if (operador == Operador.Sumar) {
      resultado = double.parse(numero1) + double.parse(numero2);
    } else if (operador == Operador.Restar) {
      resultado = double.parse(numero1) - double.parse(numero2);
    } else if (operador == Operador.Multiplicar) {
      resultado = double.parse(numero1) * double.parse(numero2);
    } else if (operador == Operador.Dividir) {
      resultado = double.parse(numero1) / double.parse(numero2);
    }
    notifyListeners();
  }

  limpiar() {
    numero1 = "";
    numero2 = "";
    escribiendoNumero1 = true;
    resultado = 0;
    notifyListeners();
  }
}
