import 'package:flutter_tutorial/models/imagen.dart';

class Raza {
  String id;
  String nombre;
  String descripcion;
  String origen;
  int afecto;
  Imagen imagen;

  Raza(
      {required this.id,
      required this.nombre,
      required this.descripcion,
      required this.origen,
      required this.afecto,
      required this.imagen});

  factory Raza.fromJson(Map<String, dynamic> json) {
    return Raza(
        id: json["id"],
        nombre: json["name"],
        descripcion: json["description"],
        origen: json["origin"],
        afecto: json["affection_level"],
        imagen: json["image"] != null
            ? Imagen.fromJson(json["image"])
            : Imagen(
                id: "",
                ancho: 0,
                largo: 0,
                url: 'https://cdn2.thecatapi.com/images/OGTWqNNOt.jpg'));
  }
}
