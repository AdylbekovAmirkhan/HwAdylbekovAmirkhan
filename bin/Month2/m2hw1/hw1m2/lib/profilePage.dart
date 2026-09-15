import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  String name = 'kto to tam';
  String age = '48 ';
  String location = 'gdeto tam';
  String bio = 'Actor';
  String interests = 'chtoto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {}, 
            icon: Icon(Icons.menu),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('images/tomhardy.jpg'),
              ),
              SizedBox(height: 16),
              Text(
                name,
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              ),
              SizedBox(height: 4),
              Text(
                age,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                location,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Padding(padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                bio,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Interests: ' + interests,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(icon: Icon(Icons.camera_alt, color: Colors.white),
                  iconSize: 30,
                  onPressed: () {},),
                  SizedBox(width: 12),
                  IconButton(icon: Icon(Icons.alternate_email, color: Colors.white),
                  iconSize: 30,
                  onPressed: () {},),
                  SizedBox(width: 12),
                  IconButton(icon: Icon(Icons.videocam, color: Colors.white),
                  iconSize: 30,
                  onPressed: () {},),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Follow', style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
