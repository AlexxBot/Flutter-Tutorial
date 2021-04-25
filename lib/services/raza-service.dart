import 'package:flutter_tutorial/models/raza.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RazaService {
  //atributos
  static const String URL = "https://api.thecatapi.com/v1/breeds";

  //metodos
  Future<List<Raza>> getBreads() async {
    var url = Uri.parse(URL);
    /* var url =
        Uri.https('https://api.thecatapi.com/v1', '/breeds', {'q': '{https}'}); */
    final respuesta = await http.get(url);
    if (respuesta.statusCode == 200) {
      final listaJson = convert.json.decode(respuesta.body);
      final List<Raza> listaRazas =
          listaJson.map<Raza>((json) => Raza.fromJson(json)).toList();
      return listaRazas;
    } else {
      return [];
    }
  }
}
