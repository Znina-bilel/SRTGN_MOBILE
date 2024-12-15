import 'package:app/bottom_screens/FaSo.dart';
import 'package:app/bottom_screens/KaNa.dart';
import 'package:app/bottom_screens/SoNa.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:app/utils/utils.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app/NaTu.dart'; // Import your NaTu page

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Add Image
  List<Reference> _uploadedFiles = [];
  late String _text = 'Fill Above';

  @override
  void initState() {
    super.initState();
    getUploadedFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: const Color.fromARGB(
            224, 255, 255, 255), // Set the background color here
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                dropdown(_text),
                const SizedBox(height: 16),
                Text(_text),
                const SizedBox(height: 16),
                _buildUI(),
                const SizedBox(height: 16),
                _buildNewsSection(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUI() {
    if (_uploadedFiles.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return SizedBox(
      height:
          200, // Provide a fixed height or adjust according to your UI requirements
      child: PageView.builder(
        itemCount: _uploadedFiles.length,
        itemBuilder: (context, index) {
          Reference ref = _uploadedFiles[index];
          return FutureBuilder(
            future: ref.getDownloadURL(),
            builder: (context, snapshot) {
              String? url = snapshot.data;
              if (snapshot.hasData) {
                return Center(
                  child: Card(
                    elevation: 5,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: GestureDetector(
                      onTap: () async {
                        // Implement onTap functionality if needed
                      },
                      child: AspectRatio(
                        aspectRatio:
                            1, // Set a fixed aspect ratio (1:1 for square)
                        child: Image.network(
                          url!,
                          fit: BoxFit
                              .cover, // Cover the available space while maintaining aspect ratio
                        ),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }

  Widget dropdown(String text) {
    TextEditingController controllerGov1 = TextEditingController();
    TextEditingController controllerGov2 = TextEditingController();
    TextEditingController controllerType = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Add the logo here
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/images/small.jpeg', // Replace with the path to your logo
            height: 300,
            // Adjust the height as needed
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomDropdown.search(
            hintText: 'Depart',
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
            items: const [
              'Tunis',
              'Nabeul',
              'Kelibia',
              'Hamamet',
              'Sousse',
              'El Fahas',
              'Zaghouan',
              'Soliman',
            ],
            controller: controllerGov1,
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: CustomDropdown.search(
            hintText: 'Arrivéé',
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
            items: const [
              'Tunis',
              'Nabeul',
              'Kelibia',
              'Hamamet',
              'Sousse',
              'El Fahas',
              'Zaghouan',
              'Soliman',
            ],
            controller: controllerGov2,
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            // Connect firebase
            final CollectionReference busTime =
                FirebaseFirestore.instance.collection("BusTime");

            // Get the selected values from the controllers
            final selectedGov1 = controllerGov1.text;
            final selectedGov2 = controllerGov2.text;
            final selectedType = controllerType.text;
            if (selectedGov1 == selectedGov2) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Repeter votre choix'),
                  duration: Duration(seconds: 2), // Durée de la notification
                ),
              );
            } else if (selectedGov1 == 'Nabeul' ||
                selectedGov1 == 'Tunis' && selectedGov2 == 'Tunis' ||
                selectedGov2 == 'Nabeul') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NaTuPage()),
              );
            }
            if (selectedGov1 == 'Kelibia' ||
                (selectedGov1 == 'Nabeul' && selectedGov2 == 'Nabeul') ||
                selectedGov2 == 'Kelibia') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => KaNaPage()),
              );
            } else if (selectedGov1 == 'El Fahas' ||
                selectedGov1 == 'Sousse' && selectedGov2 == 'Sousse' ||
                selectedGov2 == 'El Fahas') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NFaSoPage()),
              );
            } else if (selectedGov1 == 'Soliman' ||
                selectedGov1 == 'Nabeul' && selectedGov2 == 'Nabeul' ||
                selectedGov2 == 'Soliman') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SoNaPage()),
              );
            } else {
              // Search
              busTime
                  .where('From', isEqualTo: selectedGov1)
                  .where('To', isEqualTo: selectedGov2)
                  .where('Type', isEqualTo: selectedType)
                  .get()
                  .then((querySnapshot) {
                if (querySnapshot.size > 0) {
                  // Handle query results if documents are found
                  print(
                      'Data found for From: $selectedGov1, To: $selectedGov2, Type: $selectedType');
                  querySnapshot.docs.forEach((doc) {
                    print(doc.data());
                    // Display the data in the app
                    setState(() {
                      _text = doc[
                          'Time']; // Update _text with the value from Firestore document
                    });
                  });
                } else {
                  setState(() {
                    _text = 'Time Not Found';
                  });
                }
              }).catchError((error) {
                // Handle errors
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Error searching for data: $error'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              });
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Button text color
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text('Rechercher'),
        ),
      ],
    );
  }

  void getUploadedFile() async {
    List<Reference>? result = await getAllImages();

    if (result != null) {
      setState(
        () {
          _uploadedFiles = result;
        },
      );
    }
  }

  // News section widget
  Widget _buildNewsSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest News',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('News').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              var newsDocuments = snapshot.data!.docs;
              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: newsDocuments.length,
                itemBuilder: (context, index) {
                  var news = newsDocuments[index];
                  String imageUrl = news[
                      'http://www.srtgn.com.tn/site/template.php?code=23']; // Champ où vous stockez les URL des images
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
