import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ACooperante/custom_colors.dart';

class bhaskara extends StatefulWidget {
  @override
  _QuadradoState createState() => _QuadradoState();
}

class _QuadradoState extends State<bhaskara> {
  TextEditingController _PrimeiroController = TextEditingController();
  TextEditingController _SegundoController = TextEditingController();
  TextEditingController _TerceiroController = TextEditingController();
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Calculando"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              CustomColors().getGradientMainColor(),
              CustomColors().getGradientSecondaryColor(),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Resolução Bhaskara\n",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _PrimeiroController,
                      autofocus: true,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Valor de A",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _SegundoController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Valor de B",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: _TerceiroController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: "Valor de C",
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
              ),
              ElevatedButton(
                onPressed: () {
                  var a = double.tryParse(_PrimeiroController.text);
                  var b = double.tryParse(_SegundoController.text);
                  var c = double.tryParse(_TerceiroController.text);

                  var n1 = b! * b;

                  var n2 = -4 * a! * c!;

                  var n3 = n1 + n2;

                  var n = sqrt(n3);

                  var m = 2 * a;

                  var x1 = (-b + n) / m;
                  var x2 = (-b - n) / m;

                  if (x1 > 0 || x1 <= 0 || x2 > 0 || x2 <= 0) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Resolução força resultante\n'),
                          content: Text('${b}² . -4 . ${a} . ${c}'
                              'X = ${b} ± √${n3} / ${m}\n'
                              '___________________________\n'
                              'X1 = ${b} + ${n} / ${m}\n'
                              'X1 = ${x1}\n'
                              '___________________________\n'
                              'X2 = ${b} - ${n} / ${m}\n'
                              'X2 = ${x2}\n'),
                        );
                      },
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                              'Informe valores validos!\n Para X1 e X2 terem valores positivos'),
                          content: Text(
                              'Se estiver testando podo utilizar os seguintes valores:\n'
                              'A = 1\n'
                              'B = 8\n'
                              'C = -9'),
                        );
                      },
                    );
                  }
                },
                child: Text(
                  "Calcular",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    CustomColors().getActivePrimaryButtonColor(),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
