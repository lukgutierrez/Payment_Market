import 'package:flutter/material.dart';
import 'package:mercado_pago/models/mercado_pago.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MercadoPago()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    child: Text("Hello Pro"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
