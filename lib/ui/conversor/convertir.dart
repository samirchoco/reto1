import 'package:flutter/material.dart';

class Convertir extends StatefulWidget {
  const Convertir({super.key});

  @override
  State<Convertir> createState() => _ConvertirState();
}

class _ConvertirState extends State<Convertir> {
  List<List<double>> factor = [
    [1, 4000, 5000],
    [0.00025, 1, 1.25],
    [0.0002, 0.8, 1],
  ];

  bool pesoO = false;
  bool dollarO = false;
  bool euroO = false;

  bool pesoD = false;
  bool dollarD = false;
  bool euroD = false;
  TextEditingController divA = TextEditingController(text: '0.0');
  TextEditingController divB = TextEditingController(text: '0.0');

  int indO = 0;
  int indD = 0;

  void cambiarestadoO(String moneda) {
    if (moneda == 'COP') {
      pesoO = pesoO ? false : true;
      if (pesoO == true) {
        dollarO = false;
        euroO = false;
        indO = 0;
      }
    } else if (moneda == 'USD') {
      dollarO = dollarO ? false : true;
      if (dollarO == true) {
        pesoO = false;
        euroO = false;
        indO = 1;
      }
    } else if (moneda == 'EUR') {
      euroO = euroO ? false : true;
      if (euroO == true) {
        pesoO = false;
        dollarO = false;
        indO = 2;
      }
    }
    convierte(); // cambiar estado
    setState(() {});
  }

  void cambiarestadoD(String moneda) {
    if (moneda == 'COP') {
      pesoD = pesoD ? false : true;
      if (pesoD == true) {
        dollarD = false;
        euroD = false;
        indD = 0;
      }
    } else if (moneda == 'USD') {
      dollarD = dollarD ? false : true;
      if (dollarD == true) {
        pesoD = false;
        euroD = false;
        indD = 1;
      }
    } else if (moneda == 'EUR') {
      euroD = euroD ? false : true;
      if (euroD == true) {
        pesoD = false;
        dollarD = false;
        indD = 2;
      }
    }
    convierte();
    setState(() {});
  }

  void valores(String p) {
    if (divA.text == '0.0') divA.clear();
    divA.text = divA.text + p;
  }

  void convierte() {
    double valorO = double.parse(divA.text);
    divB.text = (valorO * factor[indD][indO]).toString();
    print(factor);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(" Conversor De Monedas "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Moneda Origen'),
                GestureDetector(
                  onTap: () => cambiarestadoO('COP'),
                  child: monedas(moneda: pesoO, texto: 'COP'),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO('USD'),
                  child: monedas(moneda: dollarO, texto: 'USD'),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoO('EUR'),
                  child: monedas(moneda: euroO, texto: 'EUR'),
                ),
              ],
            ),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: divA,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Moneda Destino'),
                GestureDetector(
                  onTap: () => cambiarestadoD('COP'),
                  child: monedas(moneda: pesoD, texto: 'COP'),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD('USD'),
                  child: monedas(moneda: dollarD, texto: 'USD'),
                ),
                GestureDetector(
                  onTap: () => cambiarestadoD('EUR'),
                  child: monedas(moneda: euroD, texto: 'EUR'),
                ),
              ],
            ),
            const SizedBox(
              height: 1,
            ),
            TextField(
              readOnly: true,
              controller: divB,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(hintText: '0.0'),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    valores('7');
                  },
                  child: const boton(valor: '7'),
                ),
                GestureDetector(
                  onTap: () => valores('8'),
                  child: const boton(valor: '8'),
                ),
                GestureDetector(
                  onTap: () => valores('9'),
                  child: const boton(valor: '9'),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () => valores('4'),
                child: const boton(valor: '4'),
              ),
              GestureDetector(
                onTap: () => valores('5'),
                child: const boton(valor: '5'),
              ),
              GestureDetector(
                onTap: () => valores('6'),
                child: const boton(valor: '6'),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => valores('1'),
                  child: const boton(valor: '1'),
                ),
                GestureDetector(
                  onTap: () => valores('2'),
                  child: const boton(valor: '2'),
                ),
                GestureDetector(
                  onTap: () => valores('3'),
                  child: const boton(valor: '3'),
                ),
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              GestureDetector(
                onTap: () {
                  divA.text = '0.0';
                  divB.text = '0.0';
                },
                child: const boton1(valor: 'RESET'),
              ),
              GestureDetector(
                onTap: () => valores('0'),
                child: const boton(valor: '0'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class monedas extends StatelessWidget {
  const monedas({Key? key, required this.moneda, required this.texto})
      : super(key: key);

  final bool moneda;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: CircleAvatar(
        backgroundColor:
            moneda == true ? Color.fromARGB(255, 11, 255, 7) : Colors.red,
        child: Text(
          texto,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
    );
  }
}

class boton extends StatelessWidget {
  final String valor;
  const boton({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 90,
        height: 90,
        color: Colors.red,
        child: Center(
          child: Text(valor, style: const TextStyle(fontSize: 70)),
        ),
      ),
    );
  }
}

class boton1 extends StatelessWidget {
  final String valor;
  const boton1({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 187,
        height: 90,
        color: Color.fromARGB(137, 218, 36, 36),
        child: Center(
          child: Text(valor, style: const TextStyle(fontSize: 70)),
        ),
      ),
    );
  }
}
