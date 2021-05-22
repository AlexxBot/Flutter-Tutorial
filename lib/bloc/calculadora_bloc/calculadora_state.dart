part of 'calculadora_bloc.dart';

abstract class CalculadoraState {}

class InitState extends CalculadoraState {}

class ResultadoState extends CalculadoraState {
  double resultado;

  ResultadoState({required this.resultado});
}
