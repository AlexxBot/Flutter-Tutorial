part of 'calculadora_bloc.dart';

enum Operador { Sumar, Restar, Multiplicar, Dividir }

abstract class CalculadoraEvent {}

class OperarEvent extends CalculadoraEvent {
  Operador operador;
  String numero1;
  String numero2;

  OperarEvent({required this.operador, this.numero1 = "", this.numero2 = ""});
}
