// ignore_for_file: prefer_const_constructors, unused_label, dead_code

import 'package:flutter/material.dart';
import 'package:grid_view_task2/grid_view.dart';
 
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridViewScreen(),
    );
  }
}



