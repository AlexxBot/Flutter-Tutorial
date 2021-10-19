import 'package:flutter/material.dart';
import 'package:flutter_tutorial/bloc/calculadora_bloc/calculadora_bloc.dart';
import 'package:flutter_tutorial/services/auth-service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  late final TextEditingController _email;
  late final TextEditingController _password;

  bool _ocultar = false;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: '');
    _password = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  void _login() {
    //
    authService
        .singIn(_email.text, _password.text)
        .then((token) => print('este es el token en la vista $token'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'email', border: OutlineInputBorder()),
                controller: _email,
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              TextFormField(
                obscureText: _ocultar,
                //obscuringCharacter: '*',
                decoration: InputDecoration(
                    hintText: 'password', border: OutlineInputBorder()),
                controller: _password,
              ),
              Positioned(
                  bottom: 5,
                  right: 0,
                  child: IconButton(
                      icon: Icon(Icons.remove_red_eye_sharp),
                      color: Colors.blue,
                      onPressed: () => setState(() => _ocultar = !_ocultar)))
            ]),
            SizedBox(
              height: 20,
            ),
            RawMaterialButton(
              elevation: 20,
              child: Text(
                "Login",
                style: TextStyle(fontSize: 16),
              ),
              onPressed: _login,
              fillColor: Colors.blue,
              //shape: StadiumBorder(),
              shape: RoundedRectangleBorder(
                //side: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            )
          ],
        ),
      )),
    );
  }
}
