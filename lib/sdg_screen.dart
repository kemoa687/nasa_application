import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nasa_application/personal_profile.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  String? _username;
  String? _school;
  String? _uid;
  String? _community;

  // Image assets paths based on the school field
  Map<String, String> schoolImageMap = {
    "Global Changemakers School": "assets/global_change_makers.jpg",
    "Green Guardians": "assets/green_guardians.jpg",
    "Health & Well-Being Advocates School": "assets/health_and_well_being_advocators.jpg",
    "Green Guardians School": "assets/green_guardians.jpg",
    "Sustainable Growth Pioneers School": "assets/sustainable_growth_pioneers.jpg",
  };

  // Function to get current user's details from Firestore
  Future<void> _getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      setState(() {
        _uid = user.uid;
      });

      // Get user document from Firestore
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      if (userDoc.exists) {
        setState(() {
          _username = userDoc['username']; // Assuming the username is in the document
          _school = userDoc['ai_response']['school']; // Accessing the school field in ai_response
          _community = userDoc['ai_response']['community'];
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _getUserDetails(); // Fetch user details on initialization
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('User Profile'),
      // ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Center(
          child: _uid == null
              ? CircularProgressIndicator() // Loading state until data is fetched
              : Container(
            width: 400,
                height: 800,
                child: Stack(
                          children: [
                if (_school != null)
                  Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(schoolImageMap[_school]!), fit: BoxFit.fill)
                    ),
                    // child: Image.asset(
                    //   schoolImageMap[_school] ?? 'assets/images/default.png',
                    //   // width: 150,
                    //   // height: 150,
                    //   //
                    // ),
                  ),
                            Positioned(
                              top: screenHeight / 7.8,
                                left: screenWidth / 10 ,
                                child: Text("$_username", style: TextStyle(fontSize:40, fontWeight: FontWeight.bold ,color: Colors.grey),textAlign: TextAlign.center,)),
                            Positioned(
                                bottom: screenHeight / 10,
                                left: screenWidth/8,
                                child: Text("$_community", style: TextStyle(fontSize:40, fontWeight: FontWeight.bold ,color: Colors.grey), textAlign: TextAlign.center,)),
                          ],
                        ),
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => DashboardScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
              ));
        },
      ),
    );
  }
}
