import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:secondopi/pages/find_doctor.dart';
import 'package:secondopi/pages/Specialties.dart';
import 'package:secondopi/pages/about_us.dart';
import 'package:secondopi/pages/help.dart'; // Ensure this path is correct
import 'package:secondopi/pages/specialties.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // To Disable Debug Banner
      home: FindDoctor(), // Set HelpPage as the home widget
    );
  }
}
