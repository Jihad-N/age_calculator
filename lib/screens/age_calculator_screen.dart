import 'package:flutter/material.dart';

class AgeCalculatorScreen extends StatefulWidget {
  const AgeCalculatorScreen({super.key});

  @override
  State<AgeCalculatorScreen> createState() => _AgeCalculatorScreenState();
}

class _AgeCalculatorScreenState extends State<AgeCalculatorScreen> {
  final TextEditingController _dateController = TextEditingController();
  String ageResult = '';

  void selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
    );
    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";

        ageResult = calculateAge(pickedDate).toString();
      });
    }
  }

  //calculate Age method
  String calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    int months = today.month - birthDate.month;
    int days = today.day - birthDate.day;
    if (days < 0) {
      //if the current day is less than the birth day, we need to borrow days from the previous month
      months--;
      days += DateTime(today.year, today.month, 0).day;
    }

    if (months < 0) {
      //if the current month is less than the birth month, we need to borrow months from the previous year
      age--;
      months += 12;
    }

    return 'Age: $age year | $months month | $days day';
  }

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

      body: Container(
        color: Color(0xff000035),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/image.png'), height: 200),
              SizedBox(height: 30),
              TextField(
                controller: _dateController,
                readOnly: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.white),
                  labelText: "Date of Birth",
                  hintText: 'Select your date of birth',
                 
                  suffixIcon: Icon(Icons.calendar_month, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
                onTap: () => selectDate(),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffdd59b3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ageResult,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
