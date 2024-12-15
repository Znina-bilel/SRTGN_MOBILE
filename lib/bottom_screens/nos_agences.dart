import 'package:flutter/material.dart';

class NosAgences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nos Agences',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 150, // Ajustez la taille du logo
                width: 150,
                fit: BoxFit.contain, // Ajustez la taille du logo
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '13 Agences',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildAgenceInfo(
              context,
              'Nabeul',
              'Avenue Habib Thameur (El ahwach) - Nabeul',
              '72 221 119',
              'Adel LAAROUS',
            ),
            SizedBox(height: 16.0),
            _buildAgenceInfo(
              context,
              'Korba',
              'Avenue Habib Bourguiba - Korba',
              '72 384 453',
              'Amor KHALIFA',
            ),
            SizedBox(height: 16.0),
            _buildAgenceInfo(
              context,
              'Menzel Temime',
              'Avenue Farhat Hachad (Rue de Kélibia) - Menzel Temime',
              '72 344 047',
              'Omar LAHWEG',
            ),
            _buildAgenceInfo(
              context,
              'Kélibia',
              'Avenue Ali Balhouan - Kélibia',
              '72 296 208',
              'Mounir HAJRI',
            ),
            _buildAgenceInfo(
              context,
              'Haouaria',
              'Avenue Habib Bourguiba - Haouaria',
              '72 297 012',
              'Mohsen ELBACH',
            ),
            _buildAgenceInfo(
              context,
              'Soliman',
              'Avenue de la République – Soliman',
              '72 290 066',
              'Mohamed BEN HAMOUDA',
            ),
            _buildAgenceInfo(
              context,
              'Menzel Bouzelfa',
              'Avenue Habib Bourguiba - Menzel Bouzelfa',
              '72 292 031',
              'Bilel BALAI',
            ),
            _buildAgenceInfo(
              context,
              'Beni Kalled',
              'Avenue Habib Bourguiba - Beni Kalled',
              '72 371 087',
              'Slim MLOUKI',
            ),
            _buildAgenceInfo(
              context,
              'Grombalia',
              'Route de Beni Kalled - Grombalia',
              '72 255 060',
              'Elyes HAMED',
            ),
            _buildAgenceInfo(
              context,
              'Hammamet',
              'Avenue Mohamed V ( Manaret Hammamet ) - Hammamet',
              '72 227 711',
              'El Fehri MABROUK',
            ),
            _buildAgenceInfo(
              context,
              'Zaghouan',
              'Cité Industrielle - Zaghouan',
              '72 676 376',
              'Chokri BEN MEFTEH',
            ),
            _buildAgenceInfo(
              context,
              'El Fahs',
              'Route kedouat Echayr - El Fahs',
              '72 670 455',
              'Lotfi GARSI',
            ),
            _buildAgenceInfo(
              context,
              'Tunis',
              'Gare Routière du Tunis - sud ( Bab Alioua )',
              '71 492 456',
              'Tarek BELHADI',
            ),
            // Add other agences here similarly
            SizedBox(height: 32.0),
            Text(
              'Nos Ateliers d’entretien',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildAtelierInfo(
              context,
              'Grombalia',
              'Route de Beni Kalled - Grombalia',
              'Kaies KORAANI (Chef Service Maintenance Grombalia)',
              '72 255 191',
            ),
            _buildAtelierInfo(
              context,
              'Nabeul ',
              'Avenue Habib Thameur - Nabeul',
              'Sami BEN FRADJ (Chef service Maintenance Nabeul)',
              '72 285 808 - 72 287 000',
            ),
            _buildAtelierInfo(
              context,
              'Menzel Temime ',
              'Avenue Farhat Hachad ( Route de Kélibia ) - Menzel Temime',
              'Fouad RHAYEM (chef noyau)',
              '72 300 103',
            ),
            _buildAtelierInfo(
              context,
              'Zaghouan ',
              'Cité Industrielle - Zaghouan',
              'Zoubair EL CHEIKH (chef noyau)',
              '72 676 376',
            ),
            // Add other workshops here similarly
          ],
        ),
      ),
    );
  }

  Widget _buildAgenceInfo(BuildContext context, String title, String address,
      String phone, String manager) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8.0),
        Text('Adresse: $address'),
        Text('Tél: $phone'),
        Text('Chef d\'agence: $manager'),
        SizedBox(height: 16.0),
        Divider(),
      ],
    );
  }

  Widget _buildAtelierInfo(BuildContext context, String title, String address,
      String manager, String phone) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8.0),
        Text('Adresse: $address'),
        Text('Responsable: $manager'),
        Text('Tél: $phone'),
        SizedBox(height: 16.0),
        Divider(),
      ],
    );
  }
}
