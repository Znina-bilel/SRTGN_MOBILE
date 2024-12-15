import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_core/firebase_core.dart';

// ignore: body_might_complete_normally_nullable
Future<List<Reference>?> getAllImages() async {
  try {
    final storageRef = FirebaseStorage.instance.ref().child("images");
    final listResult = await storageRef.listAll();

    return listResult.items;
  } catch (e) {
    print("----------- ERRORR -----------");
    print(e);
  }
}

Future<List<String>> getImageUrls() async {
  try {
    final storageRef = FirebaseStorage.instance.ref().child("images");
    final listResult = await storageRef.listAll();

    // Iterate over each item (image) and get its download URL
    List<String> imageUrls = [];
    await Future.forEach(listResult.items, (Reference ref) async {
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    });

    return imageUrls;
  } catch (e) {
    print('Error fetching image URLs: $e');
    return []; // Return an empty list in case of an error
  }
}

Future<void> deleteImage(String name) async {
  try {
    // Get reference to the Firebase Storage instance
    final Reference storageRef = FirebaseStorage.instance
        .refFromURL("gs://signin-example-47df8.appspot.com/images/$name");

    // Delete the image
    await storageRef.delete();
    print('Image deleted successfully');
  } catch (e) {
    print('Error deleting image: $e');
    // Handle errors here
  }
}

class FirebaseService {
  // get collection notes
  final CollectionReference users =
      FirebaseFirestore.instance.collection("Contact");

  // Create
  Future<void> addMessage(String user, String message, String email, {required Locale locale}) {
    return users.add({
      'Full Name': user,
      'Message': message,
      'Email': email,
      'Updated Time': Timestamp.now(),
    });
  }

  // READ
  Stream<QuerySnapshot> getUsersStream() {
    final usersStream =
        users.orderBy('Updated Time', descending: true).snapshots();
    return usersStream;
  }

  // Update
  Future<void> updateNote(String DocID, String newUser) {
    return users.doc(DocID).update({
      'Full Name': newUser,
      'Updated Time': Timestamp.now(),
    });
  }

  // Delete

  Future<void> deleteNote(String docID) async {
    return users.doc(docID).delete();
  }
}
