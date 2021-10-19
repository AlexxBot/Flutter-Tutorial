import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String URL = "http://192.168.100.59:3000/auth";

  static const Map<String, String> HEADERS = {
    "Content-Type":
        "application/json" /* ,
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "DELETE, POST, GET",
    "Access-Control-Allow-Headers":
        "Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With" */
  };

  var hayError;

  Future<String> singIn(String email, String password) async {
    try {
      //print('este es el email $email');
      //print('este es el password $password');
      Map<String, dynamic> parametros = {"email": email, "password": password};
      final parametrosJson = json.encode(parametros);
      final url = Uri.parse(URL + '/signin');
      final response = await http.post(url,
          headers: {"Content-type": "application/json"}, body: parametrosJson);
      if (response.statusCode == 200) {
        Map<String, dynamic> responseJson = json.decode(response.body);
        final token = responseJson["token"];
        hayError = false;
        return token;
      } else {
        hayError = true;
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<String> singInDio(String email, String password) async {
    try {
      //print('este es el email $email');
      //print('este es el password $password');
      Map<String, dynamic> parametros = {"email": email, "password": password};
      final parametrosJson = json.encode(parametros);
      final url = Uri.parse(URL + '/signin');
      //print(url);
      //print(parametrosJson);
      var dio = Dio(); // with default Options

      // Set default configs
      dio.options.baseUrl = URL;
      print('antes del post');
      /* final responseproducts =
          await http.get(Uri.parse("http://192.168.100.59:3000/products")); */
      final responsePost = await http.post(url,
          headers: {"Content-type": "application/json"}, body: parametrosJson);
      //print('status code' + responsePost.statusCode.toString());
      final response = await dio.post(
        '/signin',
        data: parametros,
      );
      if (response.statusCode == 200) {
        final token = json.decode(response.data);
        print(token);
        hayError = false;
        return token;
      } else {
        hayError = true;
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }
}
