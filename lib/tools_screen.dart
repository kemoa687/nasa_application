import 'package:flutter/material.dart';

class NasaToolsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NASA Tools', style: TextStyle(color: Colors.white, fontSize: 30),),
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
          // Fullscreen background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rocket.jpg'), // Path to your background image
                fit: BoxFit.cover, // Ensure the image covers the whole screen
              ),
            ),
          ),
          // The content of the screen
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // First Tool Card
                NasaToolCard(
                  title: 'NASA Earthdata Worldview',
                  description:
                  'This site is one of NASA’s primary satellite data visualization platforms, where current and historical imagery can be browsed and downloaded. You can find global and location-specific data layers by discipline or natural phenomenon.',
                ),
                SizedBox(height: 16.0),
                // Second Tool Card
                NasaToolCard(
                  title: 'NASA Earth Observatory',
                  description:
                  'This website is a resource for high-definition still images and global maps derived from NASA satellites. You can search by theme or location, and learn from each image’s descriptive captions.',
                ),
                SizedBox(height: 16.0),
                // Third Tool Card
                NasaToolCard(
                  title: 'NASA Socioeconomic Data and Applications Center (SEDAC)',
                  description:
                  'The SEDAC website contains Earth observation data that elaborates upon social and environmental dynamics, all of which connect to the SDGs. Imagery can be browsed and downloaded from this repository by creating a free login.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NasaToolCard extends StatelessWidget {
  final String title;
  final String description;

  const NasaToolCard({
    required this.title,
    required this.description,
  });

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tool title
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900], // Dark green for sustainability
              ),
            ),
            SizedBox(height: 8.0),
            // Tool description
            Text(
              description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}