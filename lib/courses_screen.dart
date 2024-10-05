import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Courses',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black, // Google Classroom-like color
        leading: Row(
          children: [
            const SizedBox(
              width: 2,
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                // This will pop the current screen and go back to the previous screen
                Navigator.pop(context);
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Fullscreen background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'), // Path to your background image
                fit: BoxFit.cover, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // The content of the screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First Course Card
                CourseCard(
                  title: 'Climate change science, research and data',
                  description: 'Modelling, analysis, scenarios, trends, variations, social economic costs, historical data, greenhouse gas and aerosols.',
                  link: 'https://www.canada.ca/en/environment-climate-change/services/climate-change/science-research-data.html',
                ),
                SizedBox(height: 16.0),
                // Second Course Card
                CourseCard(
                  title: 'Growing healthy food in space and in remote areas',
                  description: 'Living a healthy, sustainable lifestyle can be a challenge for all of us, but it can be especially difficult in remote areas on Earth—and also in space. The Canadian Space Agency (CSA) is working to learn how to grow healthy food in harsh environments.',
                  link: 'https://sdg.esa.int/',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const CourseCard({
    required this.title,
    required this.description,
    required this.link,
  });

  // Method to launch the URL
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course title
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900], // Dark green for sustainability
              ),
            ),
            SizedBox(height: 8.0),
            // Course description
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            // Hyperlink
            GestureDetector(
              onTap: () => _launchURL(link),
              child: Text(
                'Go to course',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}