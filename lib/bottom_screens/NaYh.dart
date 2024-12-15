import 'package:flutter/material.dart';

class NaYhPage extends StatelessWidget {
  const NaYhPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HaNa'),
      ),
      body: Center(
        child: Text(
          'Contenu de la page HaNa',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
