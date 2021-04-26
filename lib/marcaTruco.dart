import 'package:contatruco/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MarcaTruco extends StatefulWidget {
  @override
  _MarcaTrucoState createState() => _MarcaTrucoState();
}

class _MarcaTrucoState extends State<MarcaTruco> {
  String pUm = "";
  String pDois = "";
  int vitoriaQueda = 0;
  int vitoriaQueda2 = 0;
  int acumulaTimeUm = 0;
  int acumulaTimeDois = 0;

  int valor;

  void retiraUm() {
    setState(() {
      if (acumulaTimeUm > 0) {
        acumulaTimeUm = acumulaTimeUm - 1;
      }
    });
  }

  void zera() {
    setState(() {
      acumulaTimeUm = 0;
      acumulaTimeDois = 0;
      vitoriaQueda = 0;
      vitoriaQueda2 = 0;
    });
  }

  void retiraUmDois() {
    setState(() {
      if (acumulaTimeDois > 0) {
        acumulaTimeDois = acumulaTimeDois - 1;
      }
    });
  }

  void alteraMaisUm(int valor) {
    setState(() {
      switch (valor) {
        case 1:
          acumulaTimeUm = acumulaTimeUm + 1;
          break;
        case 3:
          acumulaTimeUm = acumulaTimeUm + 3;
          break;

        case 6:
          acumulaTimeUm = acumulaTimeUm + 6;
          break;
        case 9:
          acumulaTimeUm = acumulaTimeUm + 9;
          break;
        case 12:
          vitoriaQueda += 1;
          break;
        default:
      }
      if (acumulaTimeUm > 11) {
        acumulaTimeUm = 0;
        vitoriaQueda += 1;
      }
    });
  }

  void alteraMaisUmTimeDois() {
    setState(() {
      switch (valor) {
        case 1:
          acumulaTimeDois = acumulaTimeDois + 1;
          break;
        case 3:
          acumulaTimeDois = acumulaTimeDois + 3;
          break;

        case 6:
          acumulaTimeDois = acumulaTimeDois + 6;
          break;
        case 9:
          acumulaTimeDois = acumulaTimeDois + 9;
          break;
        case 12:
          vitoriaQueda2 += 1;
          break;
        default:
      }
      if (acumulaTimeDois > 11) {
        acumulaTimeDois = 0;
        vitoriaQueda2 += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    Map data = ModalRoute.of(context).settings.arguments;
    if (data["patoUm"] == "") {
      pUm = "FacãoZerios";
    } else {
      pUm = data["patoUm"];
    }
    if (data["patoDois"] == "") {
      pDois = "OsMarreco";
    } else {
      pDois = data["patoDois"];
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text('Truco'),
      ),
      body: Stack(
        children: <Widget>[
          new Image.asset(
            'assets/images/fundo.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Text(
                      pUm,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text("VS",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Text(
                      pDois,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3,
              ),
              //pricipal
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 14,
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Container(
                            //decoration: BoxDecoration(color: Colors.black),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextButton(
                                    onPressed: () {
                                      valor = 1;
                                      alteraMaisUm(valor);
                                    },
                                    child: Text(
                                      "+1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 94,
                        width: 95,
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.black),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    "${acumulaTimeUm}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        width: 20,
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.black),
                          child: Center(
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 40),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 99,
                        width: 97,
                        child: Container(
                          // decoration: BoxDecoration(color: Colors.black),
                          child: Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Text(
                                    "${acumulaTimeDois}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 80),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: Center(
                              child: Container(
                                // decoration: BoxDecoration(color: Colors.black),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(17, 0, 0, 0),
                                  child: TextButton(
                                    onPressed: () {
                                      alteraMaisUmTimeDois();
                                    },
                                    child: Text(
                                      "+1",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //segunda
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                retiraUm();
                              },
                              child: Text(
                                "-1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(213, 0, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                retiraUmDois();
                              },
                              child: Text(
                                "-1",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //+3 +6 +9
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(9, 64, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 3;
                                alteraMaisUm(valor);
                              },
                              child: Text(
                                "+3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 64, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 6;
                                alteraMaisUm(valor);
                              },
                              child: Text(
                                "+6",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(52, 65, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 3;
                                alteraMaisUmTimeDois();
                              },
                              child: Text(
                                "+3",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 65, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 6;
                                alteraMaisUmTimeDois();
                              },
                              child: Text(
                                "+6",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //+9 +12
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 15, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 9;
                                alteraMaisUm(valor);
                              },
                              child: Text(
                                "+9",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 12;
                                alteraMaisUm(valor);
                              },
                              child: Text(
                                "+12",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(53, 15, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 9;
                                alteraMaisUmTimeDois();
                              },
                              child: Text(
                                "+9",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: TextButton(
                              onPressed: () {
                                valor = 12;
                                alteraMaisUmTimeDois();
                              },
                              child: Text(
                                "+12",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 26),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 42, 0, 0),
                            child: Text(
                              "Vitórias = ${vitoriaQueda}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 42, 0, 0),
                            child: Text(
                              "Vitórias = ${vitoriaQueda2}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 30),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                primary: Colors.red.shade800,
                              ),
                              onPressed: () {
                                zera();
                              },
                              child: Text(
                                "Zerar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 40),
                                primary: Colors.red.shade800,
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            MyApp()));
                              },
                              child: Text(
                                "Voltar",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
