import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NvLignePage extends StatelessWidget {
  const NvLignePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voila les nouveaux lignes'),
        backgroundColor: const Color.fromARGB(255, 30, 98, 207),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('NvLignes').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No data found'));
            }

            final data = snapshot.data!.docs.map((doc) {
              return doc.data() as Map<String, dynamic>;
            }).toList();

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    title: Text('De: ${data[index]['De']}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('A: ${data[index]['A']}'),
                        Text('NumLigne: ${data[index]['NumLigne']}'),
                        Text('H1: ${data[index]['H1']}'),
                        Text('H2: ${data[index]['H2']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'NvLignePage',
    home: NvLignePage(),
  ));
}
