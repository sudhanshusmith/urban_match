import 'package:flutter/material.dart';
import 'repository_list.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GitHub Repo Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GitHub Repositories'),
          titleTextStyle: TextStyle(
            fontSize: 20,
            color:
                Color.fromARGB(255, 255, 255, 255), // Set text color to white
          ),
          backgroundColor: Color.fromARGB(
              255, 87, 111, 248), // Set custom color for AppBar background
        ),
        body: RepositoryList(),
      ),
    );
  }
}
