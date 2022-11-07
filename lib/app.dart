import 'package:flutter/material.dart';
import 'package:reto1/ui/conversor/convertir.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Conversor De Monedas",
      theme: ThemeData(primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      home: const Convertir(),
    );
  }
}
