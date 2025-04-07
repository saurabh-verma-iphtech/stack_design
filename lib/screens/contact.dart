import 'package:flutter/material.dart';
import 'package:stack_design/main.dart';

class ContactUs extends StatelessWidget {
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
      body: Center(child: Text('Contact Us Page')));
  }
}
