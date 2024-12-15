import 'package:flutter/material.dart';

class KaNaPage extends StatefulWidget {
  const KaNaPage({Key? key}) : super(key: key);

  @override
  _KaNaPageState createState() => _KaNaPageState();
}

class _KaNaPageState extends State<KaNaPage> {
  List<List<String>> tableData = []; // Tableau de données initial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('720 : Kélibia - Nabeul'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 16,
          ), // Espacement du haut et des côtés de la page
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/KaNa.png', // Chemin de votre image
                height: 350, // Hauteur de l'image
                width: double.infinity, // Largeur de l'image
                fit: BoxFit.cover, // Ajustement de la taille de l'image
              ),
              SizedBox(height: 10), // Espacement entre l'image et les boutons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tableData = [
                            [
                              '07:00*                                   ',
                              '05:20*              '
                            ],
                            ['09:00*', '07:00*'],
                            ['10:00', '08:00'],
                            ['11:00*', '09:00'],
                            ['13:00', '11:00'],
                            ['15:00', '13:00'],
                            ['16:00', '14:00'],
                            ['17:30', '15:30'],
                            ['18:30', '17:00'],
                          ]; // Mettre à jour les données du tableau
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Normal',
                        style: TextStyle(
                            color: Colors.black), // Couleur du texte en noir
                      ),
                    ),
                  ),
                  SizedBox(width: 100),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          tableData = [];
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text(
                        'Confort',
                        style: TextStyle(
                            color: Colors.black), // Couleur du texte en noir
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              if (tableData.isNotEmpty)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text('De Nabeul ')),
                      DataColumn(label: Text('De Kelibia')),
                    ],
                    rows: List.generate(
                      tableData.length,
                      (index) => DataRow(
                        cells: [
                          DataCell(
                              Text(tableData[index][0])), // Première cellule
                          DataCell(
                              Text(tableData[index][1])), // Deuxième cellule
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20), // Espacement entre le tableau et le texte
              Text(
                '                        *تلغى أيام الاحد و العطل الرسمية',
                // Votre texte
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '                        **تلغى أيام السبت  و آلاحد و العطل الرسمية',
                // Votre texte
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              Text(
                '                        ***تلغى أيام الجمعة و السبت ',
                // Votre texte
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              Text(
                '                        1 تعمل ايام الاحد و العطل الرسمية ',
                // Votre texte
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              Text(
                '                        تعمل ايام السبت فقط 2 ',
                // Votre texte
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
