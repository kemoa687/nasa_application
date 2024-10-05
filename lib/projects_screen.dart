import 'package:flutter/material.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Projects',
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
                image: AssetImage('assets/background2.jpg'),
                // Path to your background image
                fit: BoxFit.cover, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // The content of the screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First Project Card
                ProjectCard(
                  title:
                      'Develop AI solutions for local environmental or social challenges',
                  brief:
                      'Create AI-driven applications that address pressing local environmental and social issues, such as air quality monitoring or smart resource management.',
                ),
                SizedBox(height: 16.0),
                // Second Project Card
                ProjectCard(
                  title: 'Robotics competitions focused on sustainability',
                  brief:
                      'Engage students in robotics competitions designed to solve sustainability challenges like recycling automation, water conservation, or renewable energy harvesting.',
                ),
                SizedBox(height: 16.0),
                // Third Project Card
                ProjectCard(
                  title:
                      'Create tech startups aimed at clean energy or waste reduction',
                  brief:
                      'Launch innovative startups focused on reducing environmental impact through clean energy solutions or waste minimization technologies.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String brief;

  const ProjectCard({
    required this.title,
    required this.brief,
  });

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Request Sent'),
          content: Text('Your request has been sent.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.85),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Project information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Project title
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[900], // Dark green for sustainability
                    ),
                  ),
                  SizedBox(height: 8.0),
                  // Project brief
                  Text(
                    brief,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            // Plus icon button
            IconButton(
              icon:
                  Icon(Icons.add_circle, color: Colors.green[800], size: 30.0),
              onPressed: () {
                _showAlert(context); // Show alert when clicked
              },
            ),
          ],
        ),
      ),
    );
  }
}
