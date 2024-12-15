import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/de316ad3-900e-472d-ae96-3d3d66ed7022/HOPriuO8k2.json',
              height: 250, // Ajustez la taille de l'animation selon vos besoins
              width: 250,
            ),
            SizedBox(
              height: 5,
            ), // Ajoutez un espace vertical entre l'animation et le texte
            Container(
              padding: EdgeInsets.all(20), // Ajoutez un padding autour du texte
              decoration: BoxDecoration(
                color: Colors.grey[200], // Couleur du fond du cadre
                borderRadius:
                    BorderRadius.circular(10), // Rayon des coins du cadre
              ),
              child: Text(
                'Découvrez notre application mobile pour la Société du Transport de Gouvernaurat de Nabeul. '
                'Restez informé sur les horaires, les itinéraires, les tarifs et les dernières actualités '
                'de votre service de transport local. Profitez d\'une expérience conviviale et pratique '
                'pour organiser vos déplacements en toute simplicité.',
                textAlign: TextAlign.center, // Alignement du texte
                style: TextStyle(fontSize: 15), // Taille du texte
              ),
            ),
            SizedBox(height: 20), // Ajoutez un espace vertical après le texte
            ElevatedButton(
              onPressed: () {
                launch('https://www.facebook.com/SRTGNabeul2016');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Couleur du premier bouton
              ),
              child: Text(
                'Facebook',
                style:
                    TextStyle(color: Colors.white), // Couleur du texte en blanc
              ),
            ),
            SizedBox(
              height: 10,
            ), // Ajoutez un espace vertical entre les boutons
            ElevatedButton(
              onPressed: () {
                launch('http://www.srtgn.com.tn/site/template.php?code=53#?');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Couleur du deuxième bouton
              ),
              child: Text(
                'Site Web',
                style:
                    TextStyle(color: Colors.white), // Couleur du texte en blanc
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: More(),
  ));
}
