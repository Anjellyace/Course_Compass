import 'package:course_compass/pages/description_page.dart';
import 'package:flutter/material.dart';

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  String? selectedLocation; // This will hold the selected dropdown value

  @override
  Widget build(BuildContext context) {
    // Determine if the theme is dark
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    
    // Set colors based on the theme
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final courseContainerColor = isDarkMode ? Colors.grey[850] : Colors.grey[200];
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 111, 190, 236),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(26),
            bottomRight: Radius.circular(26),
          ),
        ),
        title: const Text(
          'COURSE COMPASS',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the first page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30), // Space between AppBar and the text
            Text(
              'In that case, here are the best courses that\nalign with your interests!',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: textColor),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedLocation, // Bind selected value
                      hint: Text('Any Location', style: TextStyle(color: textColor)),
                      items: <String>[
                        'Makati City', 
                        'Pasig City', 
                        'Manila City', 
                        'Quezon City', 
                        'Taguig City'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: TextStyle(color: textColor)),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLocation = newValue; // Update selected value
                        });
                      },
                      dropdownColor: isDarkMode ? Colors.grey[800] : Colors.white, // Dropdown background
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20), // Space between dropdown and content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCourseContainer('Course 1', 'Location 1', 'University 1', context, textColor, courseContainerColor),
                    const SizedBox(height: 10),
                    buildCourseContainer('Course 2', 'Location 2', 'University 2', context, textColor, courseContainerColor),
                    const SizedBox(height: 10),
                    buildCourseContainer('Course 3', 'Location 3', 'University 3', context, textColor, courseContainerColor),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function that builds a clickable container
  Widget buildCourseContainer(String course, String location, String university, BuildContext context, Color textColor, Color? containerColor) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DescriptionPage(course: course)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(course, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: textColor)),
            Text(location, style: TextStyle(fontSize: 16, color: textColor)),
            Text(university, style: TextStyle(fontSize: 16, color: textColor)),
          ],
        ),
      ),
    );
  }
}
