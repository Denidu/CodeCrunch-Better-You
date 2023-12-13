import 'package:codecrunch/screens/ExersicePage.dart';
import 'package:codecrunch/screens/InfoPage.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'CameraPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

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
      body: Container(
        color: Colors.blue[50],
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 130),
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
            const SizedBox(height: 0),
            const Text(
              'Choose Exercise',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyExercisePage()),
                );
              },
              child: Image.asset(
                "assets/blue.png",
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {}, // needed
              child: Image.asset(
                "assets/blue1.png",
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Welcome To',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const Text(
              'BetterYou FITNESS APP',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins"),
            ),
            const Text(
              'Choose any exercise you like,',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'BetterYou Will Guide You!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: "Poppins",
              ),
              textAlign: TextAlign.center,
            ),
          ],
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
