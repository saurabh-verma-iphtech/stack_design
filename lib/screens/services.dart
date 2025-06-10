import 'package:flutter/material.dart';
import 'package:movies_hub/main.dart';

class Services extends StatelessWidget {
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
      body: Center(child: Text('Service Page')));
  }
}
