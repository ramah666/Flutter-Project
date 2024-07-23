import 'package:flutter/material.dart';
import '/easy_faq.dart';
import 'package:secondopi/pages/footer.dart';
import 'package:secondopi/pages/upper_bar.dart';

void main() {
  runApp(MaterialApp(
    home: HelpPage(),
  ));
}

class HelpPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      'question': 'How does the second opinion booking process work?',
      'answer': 'To book a second opinion, you need to register on our platform, fill out your medical details, and choose a specialist. Once the specialist reviews your case, you will receive an email with their opinion.',
    },
    {
      'question': 'What types of medical conditions can I seek a second opinion for?',
      'answer': 'You can seek a second opinion for a wide range of medical conditions including chronic illnesses, complex diagnoses, and treatment options.',
    },
    {
      'question': 'How long does it take to receive a second opinion?',
      'answer': 'The turnaround time for a second opinion varies depending on factors such as the complexity of your case and the availability of the chosen specialist. Typically, you can expect to receive your second opinion within 5-7 days of submitting your request.',
    },
    {
      'question': 'Is my medical information secure?',
      'answer': 'Yes, we take your privacy very seriously. All medical information is stored securely and shared only with the specialist you select for the second opinion.',
    },
    {
      'question': 'What is the cost of a second opinion?',
      'answer': 'The cost of a second opinion varies depending on the specialist and the complexity of the case. Pricing details will be provided once you select a specialist and submit your request.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar(),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/icons/blueBubble.jpg', // Adjust the path based on your image location
              fit: BoxFit.cover,
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Help Center',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Here you will find answers to frequently asked questions. '
                              'If you need further assistance, please contact our support team.',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      ...faqData.map((faq) => EasyFaq(
                        question: faq['question']!,
                        answer: faq['answer']!,
                        questionTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        anserTextStyle: TextStyle(fontSize: 16),
                      )).toList(),
                    ],
                  ),
                ),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
