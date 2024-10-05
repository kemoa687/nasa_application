import 'package:flutter/material.dart';
import 'package:nasa_application/projects_screen.dart';
import 'package:nasa_application/tools_screen.dart';

import 'courses_screen.dart';
import 'event_screen.dart';
import 'jops_screen.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 30),),
        backgroundColor: Colors.black, // Google Classroom-like color
        leading:  Row(
          children: [
            const SizedBox(width: 2,),
            IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white, size: 30,),
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
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.jpg'), // Path to your image
                fit: BoxFit.cover, // Makes sure the image covers the entire screen
              ),
            ),
          ),
          // Scrollable content on top of the background image
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Courses Card
                    DashboardCard(
                      icon: Icons.book,
                      label: 'Courses',
                      color: Colors.blue[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => CourseScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
                            ));

                        // Navigate to Courses
                        print('Courses tapped');
                      },
                    ),
                    SizedBox(height: 16.0),
                    // Projects Card
                    DashboardCard(
                      icon: Icons.work,
                      label: 'Projects',
                      color: Colors.orange[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ProjectScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
                            ));
                        // Navigate to Projects
                        print('Projects tapped');
                      },
                    ),
                    SizedBox(height: 16.0),
                    // Events Card
                    DashboardCard(
                      icon: Icons.event,
                      label: 'Events',
                      color: Colors.red[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => EventScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
                            ));
                        print('Events tapped');
                      },
                    ),
                    SizedBox(height: 16.0),
                    // Jobs Card
                    DashboardCard(
                      icon: Icons.business_center,
                      label: 'Jobs',
                      color: Colors.green[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => JobScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
                            ));
                        // Navigate to Jobs
                        print('Jobs tapped');
                      },
                    ),
                    SizedBox(height: 16.0),
                    // Community Members Card
                    DashboardCard(
                      icon: Icons.rocket_launch_sharp,
                      label: 'NASA Tools',
                      color: Colors.purple[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => NasaToolsScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
                            ));
                        print('Community Members tapped');
                      },
                    ),
                    SizedBox(height: 16.0),
                    // Chat Card
                    DashboardCard(
                      icon: Icons.chat,
                      label: 'Chat',
                      color: Colors.teal[400]!.withOpacity(0.7), // Semi-transparent background
                      onTap: () {
                        // Navigate to Chat
                        print('Chat tapped');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const DashboardCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.0),
      splashColor: Colors.white.withOpacity(0.1),
      child: Container(
        width: 500,
        child: Card(
          color: color, // Semi-transparent color applied here
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 50.0,
                  color: Colors.white,
                ),
                SizedBox(height: 20.0),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
