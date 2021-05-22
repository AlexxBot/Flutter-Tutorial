part of 'cat_bloc.dart';

abstract class CatEvent {}

class ListarGatos extends CatEvent {}

class GuardarGato extends CatEvent {
  //final Cat gato;
}

class RecuperarGato extends CatEvent {}

class EliminarGato extends CatEvent {}

//
