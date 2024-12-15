import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LivePage extends StatelessWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Live Page'),
        backgroundColor: Color.fromARGB(255, 30, 98, 207),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('live').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          // Extracting data from Firebase snapshot
          final liveData =
              snapshot.data?.docs.map((doc) => doc['Bus']).toList();

          return ListView.builder(
            itemCount: liveData?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(liveData?[index] ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
