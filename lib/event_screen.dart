import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sustainability Events', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blueGrey, // SDG and sustainability themed color
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
                image: AssetImage('assets/background3.jpg'), // Replace with your image path
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
                  // First Event Card
                  EventCard(
                    title: '7th High-Level Forum on United Nations Global Geospatial Information Management',
                    date: 'Oct 8 – 10, 2024',
                    location: 'Mexico City, CDMX, Mexico',
                    description:
                    'The United Nations Committee of Experts on Global Geospatial Information Management (UN-GGIM), in collaboration with the Government of México through Instituto Nacional de Estadística y Geografía (INEGI) will convene the Seventh High-level Forum...',
                    link: 'https://ggim.un.org/meetings/2024/7th_HLF_Mexico/',
                  ),
                  SizedBox(height: 16.0),
                  // Second Event Card
                  EventCard(
                    title: 'EuroGEO Workshop 2024',
                    date: 'Oct 8 – 10, 2024',
                    location: 'Kraków, Poland',
                    description:
                    'EuroGEO is the regional coordination mechanism that aims to consolidate and coordinate activities throughout Europe that contribute to GEO initiatives. This year’s EuroGEO workshop will take place in Krakow...',
                    link: 'https://eurogeosec.eu/egw2024/',
                  ),
                  SizedBox(height: 16.0),
                  // Third Event Card
                  EventCard(
                    title: '75th International Astronautical Congress (IAC)',
                    date: 'Oct 14 – 18, 2024',
                    location: 'Milan, Italy',
                    description:
                    'The IAC 2024 will take place in Milan, focusing on space exploration, technology, and innovation, with a global perspective on the future of space travel...',
                    link: 'https://iac2024.org',
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

class EventCard extends StatefulWidget {
  final String title;
  final String date;
  final String location;
  final String description;
  final String link;

  const EventCard({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.link,
  });

  @override
  _EventCardState createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool _isExpanded = false;

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
            // Event title
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900], // Dark green for sustainability
              ),
            ),
            SizedBox(height: 8.0),
            // Event date and location
            Text(
              '${widget.date}\n${widget.location}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            // Event description with expand/collapse
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
              maxLines: _isExpanded ? null : 3, // Expand description if button is pressed
              overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            // Toggle button for "Read more" / "Show less"
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded; // Toggle expansion state
                  });
                },
                child: Text(
                  _isExpanded ? 'Show less' : 'Read more',
                  style: TextStyle(
                    color: Colors.green[800], // Green theme
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}