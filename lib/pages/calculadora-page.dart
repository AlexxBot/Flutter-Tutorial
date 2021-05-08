import 'package:flutter/material.dart';
import 'package:flutter_tutorial/provider/calculadora-provider.dart';
import 'package:flutter_tutorial/widgets/numero-widget.dart';
import 'package:flutter_tutorial/widgets/resultado-widget.dart';
import 'package:provider/provider.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  //late TextEditingController resultado;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //resultado = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Text(
            context.watch<CalculadoraProvider>().numero1.toString(),
          ),
          Text(
            context.watch<CalculadoraProvider>().numero2.toString(),
          ),
          /* Text(
            //context.read(),
            context.watch<CalculadoraProvider>().resultado.toString(),
            /* decoration: InputDecoration(
              border: OutlineInputBorder(),
            ), */
            style: TextStyle(fontSize: 40),
            //controller: resultado,
          ), */
          ResultadoWidget(),
          Row(children: [
            NumeroWidget(
              numero: "7",
              asignarNumero: () {
                //Provider.of<CalculadoraProvider>(context, listen: false);
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "7"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "7";
              },
            ),
            NumeroWidget(
              numero: "8",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "8"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "8";
              },
            ),
            NumeroWidget(
              numero: "9",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "9"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "9";
              },
            ),
            NumeroWidget(
              numero: "/",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1 = false;
                context.read<CalculadoraProvider>().operador = Operador.Dividir;
              },
              color: Colors.grey,
            )
          ]),
          Row(children: [
            NumeroWidget(
              numero: "4",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "4"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "4";
              },
            ),
            NumeroWidget(
              numero: "5",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "5"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "5";
              },
            ),
            NumeroWidget(
              numero: "6",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "6"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "6";
              },
            ),
            NumeroWidget(
              numero: "x",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1 = false;
                context.read<CalculadoraProvider>().operador =
                    Operador.Multiplicar;
              },
              color: Colors.grey,
            )
          ]),
          Row(children: [
            NumeroWidget(
              numero: "1",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "1"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "1";
              },
            ),
            NumeroWidget(
              numero: "2",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "2"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "2";
              },
            ),
            NumeroWidget(
              numero: "3",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "3"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "3";
              },
            ),
            NumeroWidget(
              numero: "+",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1 = false;
                context.read<CalculadoraProvider>().operador = Operador.Sumar;
              },
              color: Colors.grey,
            )
          ]),
          Row(children: [
            NumeroWidget(
              numero: ".",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "."
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + ".";
              },
              color: Colors.grey,
            ),
            NumeroWidget(
              numero: "0",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1
                    ? context.read<CalculadoraProvider>().numero1 =
                        context.read<CalculadoraProvider>().numero1 + "0"
                    : context.read<CalculadoraProvider>().numero2 =
                        context.read<CalculadoraProvider>().numero2 + "0";
              },
            ),
            NumeroWidget(
              numero: "=",
              asignarNumero: () => context.read<CalculadoraProvider>().operar(),
              color: Colors.grey,
            ),
            NumeroWidget(
              numero: "-",
              asignarNumero: () {
                context.read<CalculadoraProvider>().escribiendoNumero1 = false;
                context.read<CalculadoraProvider>().operador = Operador.Restar;
              },
              color: Colors.grey,
            )
          ]),
          NumeroWidget(
            fullwidth: true,
            numero: "Limpiar",
            asignarNumero: () {
              context.read<CalculadoraProvider>().limpiar();
            },
          )
        ],
      )),
    );
  }
}
