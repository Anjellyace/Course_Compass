import 'package:course_compass/pages/interest_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ThemeToggleWrapper());
}

class ThemeToggleWrapper extends StatefulWidget {
  @override
  _ThemeToggleWrapperState createState() => _ThemeToggleWrapperState();
}

class _ThemeToggleWrapperState extends State<ThemeToggleWrapper> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Course Compass',
      theme: _isDarkMode
          ? ThemeData.dark().copyWith(
              textTheme: ThemeData.dark().textTheme.apply(
                    fontFamily: 'Times New Roman',
                    bodyColor: Colors.white,
                    displayColor: Colors.white,
                  ),
            )
          : ThemeData(
              primarySwatch: Colors.blue,
              fontFamily: 'Times New Roman',
              textTheme: ThemeData.light().textTheme.apply(
                    bodyColor: Colors.black,
                    displayColor: Colors.black,
                  ),
            ),
      home: Scaffold(
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
          actions: [
            ThemeToggle(
              isDarkMode: _isDarkMode,
              onToggle: _toggleTheme,
            ),
          ],
        ),
        body: HomePage(),
      ),
    );
  }
}

class ThemeToggle extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggle;

  ThemeToggle({required this.isDarkMode, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
      onPressed: onToggle,
      color: Colors.white,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Compass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Times New Roman',
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCourse;
  final List<String> courses = [
    'Writing',
    'Teaching',
    'Cooking',
    'Photography',
    'Medicine',
    'Theater',
    'Graphic Arts',
    'Technology',
    'Architecture',
    'Engineering',
    'Business',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'What are your interests?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Select a course you\'re interested in:',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: courses.map((course) {
              return SizedBox(
                width: (MediaQuery.of(context).size.width - 50) / 3,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: selectedCourse == course ? Colors.white : Theme.of(context).textTheme.bodyLarge?.color,
                    backgroundColor: selectedCourse == course ? Color.fromARGB(255, 111, 190, 236) : Theme.of(context).buttonTheme.colorScheme?.background,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> InterestPage(selectedCourse: course,),),);
                    setState(() {
                      selectedCourse = course;
                    });
                  },
                  child: Text(
                    course,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}