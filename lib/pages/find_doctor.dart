import 'package:flutter/material.dart';
import 'package:secondopi/pages/footer.dart';
import 'package:secondopi/pages/Specialties.dart';
void main() {
  runApp(FindDoctor());
}

class FindDoctor extends StatelessWidget {
  const FindDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Second Opi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: buildDrawer(context),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildSearchBar(context),
            SizedBox(height: 20),
            Container(
              height: 600, // Set a fixed height for the PageView
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: 4,
                itemBuilder: (BuildContext context, int pageIndex) {
                  return ListView(
                    children: buildDoctorInfoCards(pageIndex),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            buildPageButtons(),
            SizedBox(height: 10),
            Footer(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
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
          icon: Icon(Icons.account_circle_outlined, color: Colors.grey[600]),
          onPressed: () {},
        ),
      ],
    );
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
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
          buildDrawerItem(Icons.help, 'Help', () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HelpPage()),
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

  Widget buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Find a doctor',
          prefixIcon: Icon(Icons.search, color: Colors.black),
          contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  List<Widget> buildDoctorInfoCards(int pageIndex) {
    List<Map<String, String>> doctors = [
      {
        'image': 'assets/icons/doctor1.jpg',
        'name': 'Dr. Samantha Garcia',
        'specialty': 'Dentist',
        'experience': '4-5 years Experience',
        'description': 'Dr. Samantha Ruthprabhu believes in the goodness and potential inherent in all human beings. She offers her unconditional positive regard in her professional therapeutic practice for her clients to rise.',
        'fees': '\$45 Consultation Fees',
        'rating': '4.5/5 Rating',
      },
      {
        'image': 'assets/icons/doctor2.jpg',
        'name': 'Dr. John Doe',
        'specialty': 'Pediatrician',
        'experience': '6 years Experience',
        'description': 'Dr. John Doe specializes in pediatric care and has been serving the community with compassion and expertise.',
        'fees': '\$50 Consultation Fees',
        'rating': '4.8/5 Rating',
      },
      // Add other doctors' data here...
    ];

    return doctors.map((doctor) {
      return buildDoctorInfoCard(
        doctor['image']!,
        doctor['name']!,
        doctor['specialty']!,
        doctor['experience']!,
        doctor['description']!,
        doctor['fees']!,
        doctor['rating']!,
      );
    }).toList();
  }

  Widget buildDoctorInfoCard(
      String imagePath,
      String doctorName,
      String specialty,
      String experience,
      String description,
      String fees,
      String rating,
      ) {
    return Card(
      color: Colors.grey[50],
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorName,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(specialty),
                    Text(experience),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(description),
            SizedBox(height: 10.0),
            Text(
              fees,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              rating,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                // Implement your logic for booking an appointment
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.0),
          child: ElevatedButton(
            onPressed: () {
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: _currentPage == index ? Colors.blue : Colors.lightBlue[100],
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              minimumSize: Size(20, 20),
              textStyle: TextStyle(fontSize: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('${index + 1}'),
          ),
        );
      })..add(
        ElevatedButton(
          onPressed: () {
            if (_currentPage < 3) {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: Colors.transparent,
            elevation: 0,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            minimumSize: Size(20, 20),
          ),
          child: Icon(Icons.double_arrow, color: Colors.blue, size: 24.0),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: Text('Home Page')),
    );
  }
}

class FindDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Find A Doctor')),
      body: Center(child: Text('Find A Doctor Page')),
    );
  }
}

class SpecialtiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Specialties')),
      body: Center(child: Text('Specialties Page')),
    );
  }
}

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help')),
      body: Center(child: Text('Help Page')),
    );
  }
}
