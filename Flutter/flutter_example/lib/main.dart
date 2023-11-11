import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TestWidget()));
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  // 줄맞춤 command + option + L
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  print('Shopping cart button is clicked');
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  print('Search button is clicked');
                },
              ),
            ],
            title: Text('Hello World'),
            centerTitle: true,
            backgroundColor: Colors.red[600],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('FAB is clicked');
            },
            child: Icon(Icons.add),
            backgroundColor: Colors.red[600],
          ),
          body: Center(
            child: Text(
              'Hello World',
              style: TextStyle(fontSize: 40, color: Colors.black),
            ),
          )),
    );
  }
}
