import 'package:flutter/material.dart';
import 'app.dart';

void main() {
  runApp(const IUEASISApp());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
      ),
      body: const Center(
        child: Text('Bienvenue sur IUEA SIS Mobile App'),
      ),
    );
  }
}
