import 'package:course_compass/pages/home_page.dart';
import 'package:course_compass/pages/welcome_page.dart';
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
        body: WelcomePage(), 
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
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage()
      );
  }
}

