import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      height: double.infinity,
      width: double.infinity,
      color:const Color.fromARGB(255, 229, 227, 227),
      child:  Center(child: Text('About Page'))));
  }
}
