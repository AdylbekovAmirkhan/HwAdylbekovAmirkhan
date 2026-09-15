import 'package:flutter/material.dart';
import 'package:hw1m2/profilePage.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Prifile',
      home: ProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
