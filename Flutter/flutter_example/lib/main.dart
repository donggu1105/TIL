import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text('I Am Rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        body: CustomContainer(),
      ),
    ),
  );
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0x9F5353FF),
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10.0,
            spreadRadius: 5.0,
            offset: Offset(10.0, 10.0),
          ),
        ],
      ),
      child:
      Center(child: Container(color: Colors.yellow, child: Text('Hello'))),
    );
  }
}
