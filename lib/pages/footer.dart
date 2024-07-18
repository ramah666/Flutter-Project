import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFC5DCFF),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'SECOND OPI',
                  style: TextStyle(
                    color: Color(0xFF10015C),
                    fontFamily: 'Aclonica',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    textBaseline: TextBaseline.alphabetic,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildColumn(
                [
                  _buildLink('Home'),
                  _buildLink('Contact Us'),
                  _buildLink('Blog'),
                  _buildLink('Terms of Service'),
                  _buildLink('Privacy Policy'),
                  _buildLink('Refund Policy'),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('Find care'),
                  _buildList(['Bangalore', 'Mumbai', 'Delhi', 'Ahmedabad', 'Indore']),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('Top Specialties'),
                  _buildList(['Therapist']),
                ],
              ),
              _buildColumn(
                [
                  _buildHeading('Chota Hospital (P) Ltd'),
                  _buildParagraph('WeWork, DLF Forum, Cybercity, Phase III, Gurugram, Haryana 122002'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(List<Widget> children) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  Widget _buildLink(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }

  Widget _buildHeading(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Text(
        item,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
          decoration: TextDecoration.none,
        ),
      ))
          .toList(),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
      ),
    );
  }
}
