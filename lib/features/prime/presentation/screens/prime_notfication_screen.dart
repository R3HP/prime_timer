import 'package:flutter/material.dart';

class PrimeNotficationScreen extends StatelessWidget {
  final int primeNumber;
  final int elapsedTime;

  const PrimeNotficationScreen({super.key, required this.primeNumber, required this.elapsedTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(alignment: Alignment.center,
            child: Container(
              width: 30,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.green,
              ),
            ),),
            Spacer(),
            Text(
              "Congrats!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "You Obtained PrimeNumber,It was : $primeNumber",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Time since last prime: $elapsedTime",
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                child: Text("Back"),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
