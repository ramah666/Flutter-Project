import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(FindDoctor());
}

class FindDoctor extends StatelessWidget {
  const FindDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // To Disable Debug
      title: 'Second Opi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: drawer(),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          searchBar(context),
        ],
      ),
    );
  }
}

AppBar appbar() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    title: Row(
      children: [
        Text(
          'SECOND',
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          ' OPI',
          style: TextStyle(
            color: Colors.blue[900],
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    ),
    actions: [
      IconButton(
        icon: Icon(Icons.account_circle, color: Colors.grey[600], size: 35),
        onPressed: () {},
      ),
    ],
    elevation: 0.0,
  );
}

Drawer drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue[900],
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            // Update this with your own functionality
          },
        ),
        ListTile(
          title: Text('Find A Doctor'),
          onTap: () {
            // Update this with your own functionality
          },
        ),
        ListTile(
          title: Text('Specialties'),
          onTap: () {
            // Update this with your own functionality
          },
        ),
        ListTile(
          title: Text('About US'),
          onTap: () {
            // Update this with your own functionality
          },
        ),
      ],
    ),
  );
}

Widget searchBar(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Color(0xff1D1617).withOpacity(0.11),
          blurRadius: 40,
          spreadRadius: 0.0,
        ),
      ],
    ),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(15),
        hintText: 'Search For Doctor',
        hintStyle: TextStyle(
          color: Color(0xffDDDADA),
          fontSize: 14,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12),
          child: SvgPicture.asset('assets/icons/Search.svg'),
        ),
        suffixIcon: Container(
          width: 100,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                VerticalDivider(
                  color: Colors.black,
                  indent: 10,
                  endIndent: 10,
                  thickness: 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      cardColor: Colors.lightBlue[50],
                    ),
                    child: PopupMenuButton<String>(
                      icon: SvgPicture.asset('assets/icons/Filter.svg'),
                      onSelected: (value) {
                        // Handle the selected specialty
                        print(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'Dermatology',
                            child: Text('Dermatology'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Gynaecology',
                            child: Text('Gynaecology'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Dental',
                            child: Text('Dental'),
                          ),
                          PopupMenuItem<String>(
                            value: 'Pediatrics',
                            child: Text('Pediatrics'),
                          ),
                        ];
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
