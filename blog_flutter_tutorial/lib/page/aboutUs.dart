import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body:Container(
        child: Center(child: Text('About us Page',style: TextStyle(fontSize: 26),)),
      )
    );
  }
}