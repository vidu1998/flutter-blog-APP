import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body:Container(
        child: Center(child: Text('Contact us Page',style: TextStyle(fontSize: 26),)),
      )
    );
  }
}