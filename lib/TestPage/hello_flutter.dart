import 'package:flutter/material.dart';

class HelloFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFEEEEEE),
      appBar: AppBar(
        title: Text('健康指导'),
      ),
      body: Center(
        child: Text('Hello Flutter'),
      ),
    );
  }
}
