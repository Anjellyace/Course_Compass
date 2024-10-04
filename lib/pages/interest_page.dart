import 'package:course_compass/pages/course_list.dart';
import 'package:flutter/material.dart';

class InterestPage extends StatefulWidget {
  final String selectedCourse;

  InterestPage({required this.selectedCourse});
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  String? personalityType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 111, 190, 236),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),
        title: Text(
          'Course Compass',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Course:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.selectedCourse,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24),
            Text(
              'How would you describe yourself?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            RadioListTile<String>(
              title: Text("I prefer to work independently! It's not my forte to interact with others daily."),
              value: 'introvert',
              groupValue: personalityType,
              onChanged: (value) {
                setState(() {
                  personalityType = value;
                });
              },
            ),
            RadioListTile<String>(
              title: Text("I'm a bit of an outgoing person! I like to socialize."),
              value: 'extrovert',
              groupValue: personalityType,
              onChanged: (value) {
                setState(() {
                  personalityType = value;
                });
              },
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: personalityType != null
                  ? () {
                      // Here you could add logic to process all the information
                      print('Selected course: ${widget.selectedCourse}');
                      print('Personality type: $personalityType');
                      // Navigate back to the home screen
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => CourseList()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  : null,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor:  Color.fromARGB(255, 111, 190, 236),
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}