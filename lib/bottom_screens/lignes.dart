import 'package:app/NaTu.dart';
import 'package:app/bottom_screens/FaSo.dart';
import 'package:app/bottom_screens/KaNa.dart';
import 'package:app/bottom_screens/NaYh.dart';
import 'package:app/bottom_screens/NaZa.dart';
import 'package:app/bottom_screens/NvLigne.dart';
import 'package:app/bottom_screens/Ramadhan.dart';
import 'package:app/bottom_screens/SoNa.dart';
import 'package:app/bottom_screens/ete.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Lignes extends StatelessWidget {
  const Lignes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choisir sur une ligne'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EtePage()),
              ); // Action pour le bouton Eté
            },
            child: const Text(
              'Eté',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ramPage()),
              ); // Action pour le bouton Ramadhan
            },
            child: const Text(
              'Ramadhan',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NvLignePage()),
              );
              // Define the action for the new button here
            },
            child: const Text(
              'Nouvelle Ligne',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 247, 251, 252),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: [
          _buildListItem('720 : Kélibia - Nabeul', 'URL_VERS_ANIMATION_1', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KaNaPage()),
            );
          }),
          _buildListItem('104 : Nabeul - Tunis', 'URL_VERS_ANIMATION_2', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NaTuPage()),
            );
          }),
          _buildListItem('115 : Nabeul - Hammamet', 'URL_VERS_ANIMATION_3', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NaYhPage()),
            );
          }),
          _buildListItem('941 : El Fahs - Sousse', 'URL_VERS_ANIMATION_4', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NFaSoPage()),
            );
          }),
          _buildListItem('226 : Soliman - Nabeul', 'URL_VERS_ANIMATION_5', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SoNaPage()),
            );
          }),
          _buildListItem('115 : Nabeul - Zaghouan', 'URL_VERS_ANIMATION_3', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NaZaPage()),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildListItem(
      String text, String animationUrl, VoidCallback onPressed) {
    return ListTile(
      leading: Lottie.network(
        'https://lottie.host/26f46481-acf8-467e-afac-d3373dd4a7c9/BCLZbxhgtb.json',
        width: 120,
        height: 120,
      ),
      title: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 30, 98, 207),
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                0), // Set border radius to 0 for square shape
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
