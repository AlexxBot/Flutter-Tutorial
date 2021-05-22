part of 'cat_bloc.dart';

abstract class CatState {}

class InitState extends CatState {}

class GatosListados extends CatState {
  final List<Raza> gatos;

  GatosListados({required this.gatos});
}

//
