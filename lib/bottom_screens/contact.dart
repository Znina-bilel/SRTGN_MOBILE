import 'package:flutter/material.dart';

class FirebaseService {
  void addMessage(String name, String message, String email,
      {required Locale locale}) {
    print(
        'Name: $name, Message: $message, Email: $email, Locale: ${locale.languageCode}');
  }
}

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  final FirebaseService firestoreService = FirebaseService();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Locale _currentLocale = const Locale('fr');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contactez-nous'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentLocale = _currentLocale.languageCode == 'fr'
                    ? const Locale('ar')
                    : const Locale('fr');
              });
            },
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Nom',
                labelStyle: TextStyle(color: Colors.white),
                hintText: _currentLocale.languageCode == 'fr'
                    ? 'Entrez votre nom'
                    : 'أدخل اسمك',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                hintText: _currentLocale.languageCode == 'fr'
                    ? 'Entrez votre email'
                    : 'أدخل بريدك الإلكتروني',
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: messageController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Message',
                labelStyle: TextStyle(color: Colors.white),
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: _currentLocale.languageCode == 'fr'
                    ? 'Entrez votre message'
                    : 'أدخل رسالتك',
                hintStyle: TextStyle(color: Colors.white),
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                firestoreService.addMessage(
                  nameController.text,
                  messageController.text,
                  emailController.text,
                  locale: _currentLocale,
                );
                nameController.clear();
                emailController.clear();
                messageController.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.blueAccent, // Background color set to blueAccent
              ),
              child: Text(
                'Envoyer',
                style: TextStyle(color: Colors.white),
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
    home: Contact(),
  ));
}
