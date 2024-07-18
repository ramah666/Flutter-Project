// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class SpecialistsSection extends StatelessWidget {
  final List<Map<String, String>> specialists = [
    {'image': 'assets/icons/DENTALimage.jpg', 'text': 'DENTAL'},
    {'image': 'assets/icons/GYNAECOLOGY.jpg', 'text': 'GYNAECOLOGY'},
    {'image': 'assets/icons/DERMATOLOGY.jpg', 'text': 'DERMATOLOGY'},
    {'image': 'assets/icons/PEDIATRICS.jpg', 'text': 'PEDIATRICS'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        children: [

          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.only(left:10),
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: specialists.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 240,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          specialists[index]['image']!,
                          width: 300,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black.withOpacity(0.3),
                        ),
                        width: 300,
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          specialists[index]['text']!,
                          style: TextStyle(
                            fontFamily: 'Futura',
                            fontSize: 33,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            // textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}