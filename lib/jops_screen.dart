import 'package:flutter/material.dart';

class JobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Jobs',
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // First Job Card
                  JobCard(
                    title: 'Green Tech Entrepreneur',
                    brief: 'A green tech entrepreneur focuses on developing innovative technologies that help reduce environmental impact, such as renewable energy solutions, green manufacturing, or sustainable consumer products.',
                  ),
                  SizedBox(height: 16.0),
                  // Second Job Card
                  JobCard(
                    title: 'Sustainable Supply Chain',
                    brief: 'A professional in sustainable supply chains ensures that all processes, from sourcing raw materials to product delivery, minimize environmental harm, reduce waste, and promote sustainability across the supply chain.',
                  ),
                  SizedBox(height: 16.0),
                  // Third Job Card
                  JobCard(
                    title: 'Environmental Specialist',
                    brief: 'An environmental specialist monitors and analyzes environmental data to ensure that companies and communities comply with regulations, protecting natural resources and reducing pollution.',
                  ),
                  SizedBox(height: 16.0),
                  // Fourth Job Card
                  JobCard(
                    title: 'Packaging Sustainability Specialist',
                    brief: 'This role focuses on creating eco-friendly packaging solutions that minimize waste, use recyclable materials, and reduce carbon footprints throughout the packaging lifecycle.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  final String title;
  final String brief;

  const JobCard({
    required this.title,
    required this.brief,
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
            // Job title
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900], // Dark green for sustainability
              ),
            ),
            SizedBox(height: 8.0),
            // Job brief
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
    );
  }
}