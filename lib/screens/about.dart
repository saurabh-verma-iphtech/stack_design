import 'package:flutter/material.dart';
import 'package:stack_design/main.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => MyHomePage()),
                    ),
              ),
            );
          },
        ),
      ),
      body: Container(
      height: double.infinity,
      width: double.infinity,
      color:const Color.fromARGB(255, 229, 227, 227),
      child:  Center(child: Text('About Page'))));
  }
}
