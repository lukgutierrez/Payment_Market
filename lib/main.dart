import 'package:flutter/material.dart';
import 'package:mercado_pago/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Payment Market',
        home: HomePage());
  }
}
