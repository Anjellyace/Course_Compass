import 'package:flutter/material.dart';

// New page that will be displayed when a course is clicked
class DescriptionPage extends StatelessWidget {
  final String course;

  const DescriptionPage({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course),
      ),
      body: Center(
        child: Text(
          'Details for $course',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}