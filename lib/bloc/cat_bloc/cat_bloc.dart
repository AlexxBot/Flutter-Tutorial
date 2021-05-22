import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/models/raza.dart';
import 'package:flutter_tutorial/services/raza-service.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  RazaService razaService;
  CatBloc({required this.razaService}) : super(InitState());

  int nroGatos = 0;

  @override
  Stream<CatState> mapEventToState(CatEvent event) async* {
    if (event is ListarGatos) {
      List<Raza> gatos = await razaService.getBreads();
      nroGatos = gatos.length;
      yield GatosListados(gatos: gatos);
    }
  }
}
