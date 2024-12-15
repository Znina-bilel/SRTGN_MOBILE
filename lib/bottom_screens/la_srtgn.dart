import 'package:flutter/material.dart';

class La extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La SRTGN'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: 150,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Raison sociale :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Société Régionale de Transport du Gouvernorat de Nabeul',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Date de création : 22 juillet 1961',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Forme juridique : Société Anonyme',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Activité : Transport public des voyageurs dans les gouvernorats de Nabeul et de Zagouan',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Siège social : 144 Avenue Habib Thameur 8019 Nabeul',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0), // Espace entre les sections
            Container(
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informations supplémentaires :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Capital social : 3.000.000 dinars',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Participation : 47% privés, 53% Etat (dont 12% gouvernorat de Nabeul et 41% 11 municipalités)',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Age moyen du parc : 11 ans 1 mois',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Agences : 13 (10 à Nabeul, 2 à Zaghouan, 1 à Bab Alioua)',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Ateliers techniques : Nabeul, Grombalia, Menzel Temime, Zaghouan',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
