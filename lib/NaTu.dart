import 'package:flutter/material.dart';

class NaTuPage extends StatefulWidget {
  const NaTuPage({Key? key}) : super(key: key);

  @override
  _NaTuPageState createState() => _NaTuPageState();
}

class _NaTuPageState extends State<NaTuPage> {
  List<List<String>> tableData = []; // Tableau de données initial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('102/140 : Nabeul  - Tunis'),
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
                'assets/images/NaTu.png', // Chemin de votre image
                height: 250, // Hauteur de l'image
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
                              '04:45*                                   ',
                              '06:30*              '
                            ],
                            ['05:15*', 'none*'],
                            ['06:30', 'none'],
                            ['07:30*', 'none'],
                            ['08:30', 'none'],
                            ['09:30', 'none'],
                            ['10:30', 'none'],
                            ['11:30', 'none'],
                            ['12:30', 'none'],
                            ['13:30', 'none'],
                            ['14:30', 'none'],
                            ['15:15', 'none'],
                            ['16:30', '17:30'],
                            ['17:30', 'none'],
                            ['none', '19:00'],
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
                          tableData = [
                            [
                              '05:30*                                   ',
                              '06:30*              '
                            ],
                            ['06:00', '07:00*'],
                            ['06:30*', '07:30'],
                            ['07:00*', '08:30(1) , 08:15*'],
                            ['10:00', '11:30'],
                            ['10:30*', '12:00'],
                            ['15:00', '16:30'],
                            ['17:30', '19:00'],
                            ['18:15', '19:30'],
                          ];
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
                      DataColumn(label: Text('De Tunis')),
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
