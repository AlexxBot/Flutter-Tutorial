import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculadora_event.dart';
part 'calculadora_state.dart';

class CalculadoraBloc extends Bloc<CalculadoraEvent, CalculadoraState> {
  //InitState initState;
  //double resultado;

  CalculadoraBloc() : super(InitState());

  @override
  Stream<CalculadoraState> mapEventToState(CalculadoraEvent event) async* {
    if (event is OperarEvent) {
      double resultado = 0;
      if (event.operador == Operador.Sumar) {
        resultado = double.parse(event.numero1) + double.parse(event.numero2);
      } else if (event.operador == Operador.Restar) {
        resultado = double.parse(event.numero1) - double.parse(event.numero2);
      } else if (event.operador == Operador.Multiplicar) {
        resultado = double.parse(event.numero1) * double.parse(event.numero2);
      } else if (event.operador == Operador.Dividir) {
        resultado = double.parse(event.numero1) / double.parse(event.numero2);
      }
      yield ResultadoState(resultado: resultado);
    }
  }
}
