import 'package:flutter/material.dart';
import 'package:contatruco/marcatruco.dart';
import 'package:flutter/services.dart';

main() => runApp(MaterialApp(
      home: MyApp(),
      routes: {
        "/marcaTruco": (context) => MarcaTruco(),
        "/main": (context) => MyApp(),
      },
    ));

class MyApp extends StatelessWidget {
  final patoUmControlller = TextEditingController();
  final patoDoisControlller = TextEditingController();
  // String patoUm = "Patos";
  // String patoDois = "Marecos";

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    void _openSecondScreen() {
      Navigator.pushNamed(
        context,
        "/marcaTruco",
        arguments: {
          "patoUm": patoUmControlller.value.text,
          "patoDois": patoDoisControlller.value.text,
        },
      );
    }

    Widget _body() {
      return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          maxLength: 10,
                          controller: patoUmControlller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Patos Um',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLength: 10,
                          controller: patoDoisControlller,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Patos Dois',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _openSecondScreen();
                          },
                          child: Container(
                            width: double.infinity,
                            child: Text(
                              'Começar',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.asset('assets/images/cartas.png', fit: BoxFit.cover),
          ),
          Container(
            color: Colors.black.withOpacity(0.0),
          ),
          _body(),
        ],
      ),
    );
  }
}
