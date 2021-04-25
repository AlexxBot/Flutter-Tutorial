class Imagen {
  String? id;
  int? ancho;
  int? largo;
  String url;

  Imagen(
      {required this.id,
      required this.ancho,
      required this.largo,
      required this.url});

  /* Imagen.inicializar() {
    id = " ";
     = 0;
    tlargo = 0;
    this.url = " ";
  } */

  factory Imagen.fromJson(Map<String, dynamic> json) {
    return Imagen(
        id: json["id"],
        ancho: json["width"],
        largo: json["height"],
        url: json["url"] == null
            ? "https://cdn2.thecatapi.com/images/OGTWqNNOt.jpg"
            : json["url"]);
  }
}
