import 'package:flutter/material.dart';

// New page that will be displayed when a course is clicked
class DescriptionPage extends StatelessWidget {
  final String course;
  const DescriptionPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Adjust space between "COURSE COMPASS" and the table
          const SizedBox(height: 110), // You can adjust the height as needed


          // Table header row
          Row(
            children: [
              Expanded(
                child: Table(
                  border: TableBorder.symmetric(inside: BorderSide(width: 1, color: Colors.grey)),
                  columnWidths: const {
                    0: FlexColumnWidth(1),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: Colors.white),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text("$course", style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Location', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('University', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),


          SizedBox(height: 50),


          // Expanded Detail Information Container
          Expanded(
            child: Container(
              width: double.infinity, // Makes the container stretch to the full width
              color: Colors.white,
              padding: EdgeInsets.all(16.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Course Overview :', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Average Tuition per Sem :', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Testimony :', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text('Possible Career :', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),


          // Back Button to course list
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: const Text('back', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}
