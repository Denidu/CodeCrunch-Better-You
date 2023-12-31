import 'package:codecrunch/screens/InfoPage.dart';
import 'package:codecrunch/screens/SummaryPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'CameraPage.dart';
import 'HomePage.dart';

class MyExercisePage extends StatefulWidget {
  const MyExercisePage({super.key});

  @override
  State<MyExercisePage> createState() => _MyExercisePage();
}

class _MyExercisePage extends State<MyExercisePage> {
  File? file;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyCameraPage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const InfoPage()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    "BETTER",
                    style: TextStyle(
                        fontSize: 45,
                        color: HexColor('#0D6B9F'),
                        fontWeight: FontWeight.w700,
                        fontFamily: "ConcertOne"),
                  ),
                  Text(
                    "YOU",
                    style: TextStyle(
                        fontSize: 45,
                        color: HexColor('#28AEFA'),
                        fontWeight: FontWeight.w700,
                        fontFamily: "ConcertOne"),
                  ),
                  Image.asset(
                    "assets/wheelChair.png",
                    height: 95,
                    width: 70,
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                'Dumbbell Shoulder Press',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Poppins"),
              ),

              const SizedBox(height: 30),
              const Text(
                'Instructions',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 10),
              const Text(
                '1. Sit in your wheelchair with your back straight and feet flat on the ground.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '2. Hold a dumbbell in each hand at shoulder height with palms facing forward',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '3. Inhale & press the dumbbells up overhead until your arms are fully extended but not locked out.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '4. Exhale and slowly lower the dumbbells back down to the starting position, stopping just short of your shoulders.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              const Text(
                '5. Repeat for the desired number of repetitions, Keeping your elbows slightly in front of your body throughout the movement. ',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
                textAlign: TextAlign.left,
              ),
              //
              //
              const SizedBox(height: 0),
              Image.asset(
                "assets/dbShoulderPress.png",
                height: 300,
                width: 300,
              ),

              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonBar(alignment: MainAxisAlignment.start, children: [
                    SizedBox(
                      width: 280.0,
                      height: 60.0,
                      child: ElevatedButton(
                        onPressed: () async {
                          final result = await FilePicker.platform
                              .pickFiles(type: FileType.video);
                          if (result != null) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const AlertDialog(
                                    title: Text("Video Processing"),
                                    content: Text(
                                        "Your video is processing. Please wait"),
                                  );
                                });

                            final fileBytes = result.files.single.bytes;
                            final fileName = result.files.single.name;

                            final uri = Uri.parse('http://api_end_point');
                            final request = http.MultipartRequest('POST', uri)
                              ..files.add(http.MultipartFile.fromBytes(
                                  'video', fileBytes!,
                                  filename: fileName));
                            final response = await request.send();

                            if (response.statusCode == 200) {
                              print('Uploaded');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SummaryPage()),
                              );
                            } else {
                              print('Something went wrong!');
                            }
                          } else {
                            final contextRef = context;

                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                      title: const Text("Error"),
                                      content: const Text(
                                          "The video selected cannot be proccessed"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(contextRef).pop();
                                          },
                                          child: const Text("OK"),
                                        )
                                      ]);
                                });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(219, 248, 255, 1.0),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "UPLOAD VIDEO",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontFamily: "Poppins",
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
