// lib/pages/help.dart
import 'package:flutter/material.dart';
import 'package:secondopi/pages/about_us.dart';
import 'package:secondopi/pages/upper_bar.dart';
import 'package:secondopi/pages/footer.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: const Text('Welcome to the Help Page')),
    );
  }
}
