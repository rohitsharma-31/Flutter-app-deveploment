import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // Added key parameter

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ContactProfilePage extends StatelessWidget {
  const ContactProfilePage({Key? key}) : super(key: key);  // Added key parameter

  @override
  Widget build(BuildContext context) {
    double unit = 8.0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Contact',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: unit * 2),
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 48, color: Colors.grey),
            ),
          ),
          SizedBox(height: unit * 2),
          Text(
            'Ethan Carter',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: unit * 1.25),
          Text(
            'Software Engineer',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: unit * 2.5),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: unit * 2),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: unit, horizontal: unit),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: Colors.grey[700]),
                      SizedBox(width: unit * 0.625),
                      Text(
                        '+1 (555) 123-4567',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: unit * 1.25),
                Container(
                  padding: EdgeInsets.symmetric(vertical: unit, horizontal: unit),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.grey[700]),
                      SizedBox(width: unit * 0.625),
                      Expanded(
                        child: Text(
                          'ethan.carter@example.com',
                          style: TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}