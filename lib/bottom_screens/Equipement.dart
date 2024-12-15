import 'package:flutter/material.dart';

class Equipement extends StatelessWidget {
  const Equipement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipements'),
        backgroundColor: Color.fromARGB(255, 30, 98, 207),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            EquipmentItem(
              imagePath: 'assets/images/Bus3.jpg',
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Type de transport  : Interurbain',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Places assises avec chauffeur  : 55'),
                  SizedBox(height: 4),
                  Text('Places debout  : 0'),
                  SizedBox(height: 4),
                  Text('Avec rideaux ou non : Avec rideaux'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            EquipmentItem(
              imagePath: 'assets/images/Bus6.jpg',
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Type de transport  : Interurbain',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Places assises avec chauffeur  : 55'),
                  SizedBox(height: 4),
                  Text('Places debout  : 0'),
                  SizedBox(height: 4),
                  Text('Avec rideaux ou non : Avec rideaux'),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            EquipmentItem(
              imagePath: 'assets/images/Bus1.jpg',
              description: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Type de transport  : urbain et suburbain',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text('Places assises avec chauffeur  : 32'),
                  SizedBox(height: 4),
                  Text('Places debout  : 93'),
                  SizedBox(height: 4),
                  Text('Avec rideaux ou non : Avec rideaux'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EquipmentItem extends StatelessWidget {
  final String imagePath;
  final Widget description;

  const EquipmentItem({
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: description,
            ),
          ],
        ),
      ),
    );
  }
}
