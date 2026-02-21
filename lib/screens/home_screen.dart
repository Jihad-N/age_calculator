import 'package:age_calculator/screens/age_calculator_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xffdd59b3),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Noah', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Age Calculator', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/nico-1.webp'),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return AgeCalculatorScreen();
                      },
                    ),
                  );
                },
                //log in button
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Text(
                    'start',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),

          // child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (BuildContext context) {
          //           return AgeCalculatorScreen();
          //         },
          //       ),
          //     );
          //   },
          //   child: Text('Start'),
          // ),
        ],
      ),
    );
  }
}
