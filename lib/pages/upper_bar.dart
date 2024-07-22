import 'package:flutter/material.dart';
import 'package:secondopi/pages/help.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: Builder(
        builder: (context) => IconButton(
          icon: Icon(Icons.menu, color: Colors.grey[600]),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      title: RichText(
        text: TextSpan(
          style: TextStyle(
            color: Colors.blueAccent[700],
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: 'Second ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: 'Opi',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: Icon(Icons.notifications, color: Colors.grey[600]),
          onPressed: () {},
        ),

        IconButton(
          icon: Icon(Icons.help, color: Colors.grey[600]),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpPage()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle_outlined, color: Colors.grey[600]),
          onPressed: () {

          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
