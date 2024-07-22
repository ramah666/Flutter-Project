import 'package:flutter/material.dart';
import 'package:secondopi/pages/footer.dart';
import 'package:secondopi/pages/find_doctor.dart';
import 'package:secondopi/pages/upper_bar.dart';
import 'package:secondopi/pages/Specialties.dart';
import 'package:secondopi/pages/help.dart';

class AboutUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Opi',
      home: AboutUs(),
    );
  }
}

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: UpperBar(),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Us Header
                  Text(
                    'ABOUT US',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Showaround is all about the activities that happen when you're not lounging around your hotel room, and they can start from the moment you arrive at your destination. From pick-up to departure, a Showaround local can be at your side - it's like having a knowledgeable friend in every city you visit. Showaround is all about the activities that happen when you're not lounging around your hotel room, and they can start from the moment you arrive at your destination. From pick-up to departure, a Showaround local can be at your side - it's like having a knowledgeable friend in every city you visit.",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Divider(thickness: 2, color: Colors.grey),

                  // Profile Section
                  ProfileSection(
                    imagePath: 'assets/icons/profile image1.png', // Path for Kushala's profile image
                    additionalImagePath: 'images/additional_image1.png', // Path for Kushala's additional image
                    title: 'Founder',
                    name: 'Kushala Chelikani',
                    description: "Showaround is all about the activities that happen when you're not lounging around your hotel room, and they can start from the moment you arrive at your destination. From pick-up to departure, a Showaround local can be at your side.",
                    isRightAligned: false,
                  ),
                  SizedBox(height: 20),
                  ProfileSection(
                    imagePath: 'assets/icons/co-founder.png', // Path for Varun's profile image
                    additionalImagePath: 'assets/icons/co-founder.png', // Path for Varun's additional image
                    title: 'Co-Founder',
                    name: 'Varun Chelikani',
                    description: "Showaround is all about the activities that happen when you're not lounging around your hotel room, and they can start from the moment you arrive at your destination. From pick-up to departure, a Showaround local can be at your side - it's like having a knowledgeable friend in every city you visit.",
                    isRightAligned: true,
                  ),

                  // Members Section
                  SizedBox(height: 20),
                  Text(
                    'MEMBERS',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MemberCard(name: 'Sthitha', imagePath: 'assets/icons/co-founder.png'),
                        MemberCard(name: 'Chandu', imagePath: 'assets/icons/member2.png'),
                        MemberCard(name: 'Abubakar', imagePath: 'assets/icons/member3.png'),
                        MemberCard(name: 'Syed', imagePath: 'assets/icons/member4.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Footer(),
          ],
        ),
      ),
    );
  }



}

class ProfileSection extends StatelessWidget {
  final String imagePath;
  final String additionalImagePath;
  final String title;
  final String name;
  final String description;
  final bool isRightAligned;

  ProfileSection({
    required this.imagePath,
    required this.additionalImagePath,
    required this.title,
    required this.name,
    required this.description,
    required this.isRightAligned,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isRightAligned ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isRightAligned) ...[
          Container(
            width: 200,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: isRightAligned ? CrossAxisAlignment.start : CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.left, // Align title to the left
              ),
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left, // Align name to the left
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.left, // Align description to the left
              ),
            ],
          ),
        ),
        if (isRightAligned) ...[
          SizedBox(width: 20),
          Container(
            width: 200,
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(additionalImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String imagePath;

  MemberCard({required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Reduced width
      margin: EdgeInsets.only(right: 10), // Add margin to separate the cards
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, offset: Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150, // Reduced height
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Member',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Reduced font size
                ),
                SizedBox(height: 5),
                Text(
                  name,
                  style: TextStyle(fontSize: 14), // Reduced font size
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        buildDrawerItem(Icons.home, 'Home', () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => HomePage()),
          // );
        }),
        buildDrawerItem(Icons.search, 'Find A Doctor', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FindDoctor()),
          );
        }),

        buildDrawerItem(Icons.add_business_rounded, 'Specialties', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Specialties()),
          );
        }),

        buildDrawerItem(Icons.info, 'About Us', () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutUs()),
          );
        }),
      ],
    ),
  );
}

ListTile buildDrawerItem(IconData icon, String title, Function() onTap) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: onTap,
  );
}