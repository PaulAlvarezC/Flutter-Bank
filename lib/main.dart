import 'package:flutter/material.dart';

import 'view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Depósito - Retiro',
      home: Home("Lista de Cuentas"),
    );
  }
}
