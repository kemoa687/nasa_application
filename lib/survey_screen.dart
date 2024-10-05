import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nasa_application/sdg_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

final DatabaseReference _database = FirebaseDatabase.instance.reference();

class Survey {
  final String question;
  final Map<String, dynamic> options;

  Survey({required this.question, required this.options});
}

class SurveyPage extends StatefulWidget {
  final String userId; // Pass the user ID from the authentication

  SurveyPage({required this.userId});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  late List<Survey> surveys;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // Parse the JSON object
    String jsonStr = '''
{
  "How old are you?": {
    "A": "Under 18",
    "B": "18-24",
    "C": "25-34",
    "D": "35-44",
    "E": "45 and above"
  },
  "What is your personality type?": {
    "A": "ISTJ",
    "B": "ISFJ",
    "C": "INFJ",
    "D": "INTJ",
    "E": "ISTP",
    "F": "ISFP",
    "G": "INFP",
    "H": "INTP",
    "I": "ESTP",
    "J": "ESFP",
    "K": "ENFP",
    "L": "ENTP",
    "M": "ESTJ",
    "N": "ESFJ",
    "O": "ENFJ",
    "P": "ENTJ"
  },
  "What is your gender?": {
    "A": "Male",
    "B": "Female",
    "C": "Prefer not to say",
    "D": "Other"
  },
  "What is your current level of education?": {
    "A": "High school",
    "B": "Undergraduate",
    "C": "Graduate",
    "D": "Postdoctoral",
    "E": "Other"
  },
  "Where are you currently studying or working?": {
    "A": "I study/work remotely",
    "B": "I study/work on-site",
    "C": "I study/work in a hybrid mode",
    "D": "Other"
  },
  "Where do you live?": {
    "A": "In a city",
    "B": "In a suburb",
    "C": "In the countryside",
    "D": "In a small town",
    "E": "Other"
  },
  "Do you have any previous experience working on Sustainable Development Goals?": {
    "A": "Yes",
    "B": "No",
    "C": "I’m not sure"
  },
  "How would you describe your primary focus in education or work?": {
    "A": "Scientific Research",
    "B": "Social Sciences",
    "C": "Business and Economics",
    "D": "Arts and Humanities",
    "E": "Engineering and Technology",
    "F": "Health and Medicine",
    "G": "Other"
  },
  "If you had to prioritize a global issue, which one would you focus on first?": {
    "A": "Providing clean drinking water to all communities",
    "B": "Ensuring quality education for everyone",
    "C": "Fighting climate change",
    "D": "Reducing hunger and ensuring food security"
  },
  "What type of project would you initiate in a rural community?": {
    "A": "A waste management system to improve sanitation",
    "B": "A program to empower women and girls with leadership skills",
    "C": "A renewable energy initiative to power",
    "D": "A health program focusing on disease prevention"
  },
  "If you were running a company, which value would be most important to you?": {
    "A": "Sustainable use of resources",
    "B": "Fair wages and decent working conditions",
    "C": "Equal opportunities for all employees",
    "D": "Technological innovation and research"
  },
  "How do you think poverty should be tackled globally?": {
    "A": "By improving education and vocational training",
    "B": "Through financial inclusion and access to banking",
    "C": "By providing access to clean water and sanitation",
    "D": "By fostering innovation and sustainable economic growth"
  },
  "Which of these areas would you invest in for the future?": {
    "A": "Renewable energy sources",
    "B": "Equal access to healthcare",
    "C": "Environmental protection and reforestation",
    "D": "Gender equality initiatives"
  },
  "Which problem in your community concerns you the most?": {
    "A": "Poor infrastructure and public transportation",
    "B": "Lack of access to healthcare facilities",
    "C": "Rising inequality between different social groups",
    "D": "Pollution and improper waste disposal"
  },
  "What kind of volunteer work would you be most interested in?": {
    "A": "Working with educational programs for underprivileged",
    "B": "Promoting clean energy solutions in remote areas",
    "C": "Raising awareness about climate change",
    "D": "Building better infrastructure in developing regions"
  },
  "How do you think we can address climate change effectively?": {
    "A": "Invest in renewable energy",
    "B": "Reduce consumption and promote sustainable lifestyles",
    "C": "Protect forests and wildlife",
    "D": "Develop international cooperation to set global policies"
  },
  "Which is more critical for ensuring gender equality?": {
    "A": "Equal pay and employment opportunities",
    "B": "Providing education for girls in underserved areas",
    "C": "Combating gender-based violence and harassment",
    "D": "Improving healthcare access for women"
  },
  "What solution would you propose to reduce hunger in poor communities?": {
    "A": "Encourage sustainable farming practices",
    "B": "Provide financial assistance to struggling farmers",
    "C": "Improve education about nutrition and food security",
    "D": "Invest in innovative agricultural technology"
  },
  "How do you think we can best protect marine ecosystems?": {
    "A": "Enforce stricter fishing regulations",
    "B": "Reduce plastic waste entering the ocean",
    "C": "Protect coral reefs and coastal habitats",
    "D": "Promote international cooperation for ocean preservation"
  },
  "How would you improve access to quality education in developing countries?": {
    "A": "Provide funding for building schools",
    "B": "Increase access to digital learning platforms",
    "C": "Train more teachers and educators",
    "D": "Provide free education for all children"
  },
  "Which of the following would you focus on to reduce inequalities?": {
    "A": "Provide equal access to healthcare services",
    "B": "Promote equal pay for all genders",
    "C": "Ensure quality education for marginalized communities",
    "D": "Strengthen policies for social inclusion"
  },
  "What is the best way to promote economic growth in developing regions?": {
    "A": "Support small and medium-sized enterprises",
    "B": "Provide equal access to technology and innovation",
    "C": "Improve access to education and training",
    "D": "Invest in renewable energy for sustainable growth"
  },
  "What would you prioritize to improve healthcare access?": {
    "A": "Build more hospitals and clinics in underserved areas",
    "B": "Train more healthcare professionals",
    "C": "Improve maternal and child healthcare services",
    "D": "Promote access to clean water and sanitation"
  },
  "How do you think technology can contribute to achieving the SDGs?": {
    "A": "By improving access to quality education through e-learning platforms",
    "B": "By developing sustainable and clean energy solutions",
    "C": "By creating smart cities that are energy efficient",
    "D": "By fostering innovation in healthcare"
  },
  "If you could influence global policy, what area would you target?": {
    "A": "Fair trade policies to reduce poverty",
    "B": "Climate change and carbon emission regulations",
    "C": "Gender equality in political leadership",
    "D": "International cooperation for healthcare systems"
  },
  "What is the most critical factor in building sustainable cities?": {
    "A": "Access to affordable housing",
    "B": "Green public transportation systems",
    "C": "Waste reduction and recycling initiatives",
    "D": "Renewable energy for all public buildings"
  },
  "Which of the following would you advocate for to promote peace and justice?": {
    "A": "Stronger laws against corruption and crime",
    "B": "Equal access to education and employment",
    "C": "Gender equality and empowerment of women",
    "D": "Addressing root causes of conflict such as poverty"
  },
  "What role do you think international partnerships play in achieving the SDGs?": {
    "A": "Helping to reduce poverty and inequality worldwide",
    "B": "Promoting renewable energy solutions globally",
    "C": "Supporting technology transfer to developing countries",
    "D": "Facilitating knowledge-sharing for healthcare systems"
  },
  "How do you typically approach challenges?": {
    "A": "Analyze the situation and develop a strategic plan",
    "B": "Brainstorm creative solutions and think outside the box",
    "C": "Collaborate with others to gather different perspectives",
    "D": "Take immediate action and learn as you go"
  },
  "How do you prefer to learn or acquire new skills?": {
    "A": "Through independent study",
    "B": "Through group discussions and collaborative learning",
    "C": "By doing hands-on projects",
    "D": "By listening to experts and attending lectures/workshops"
  },
    "In a team, what role do you naturally take on?": {
    "A": "I prefer to lead and organize the efforts",
    "B": "I enjoy being a supportive team player",
    "C": "I prefer working in the background, contributing as needed",
    "D": "I like mentoring others and helping them grow"
  },
  "What motivates you to engage in SDG-related projects?": {
    "A": "I am passionate about making a positive impact in the world",
    "B": "I feel a responsibility to help solve global challenges",
    "C": "I enjoy learning about different global issues and solutions",
    "D": "I want to connect with like-minded people and collaborate"
  },
  "How would you rate your proficiency in your current field of work or study?": {
    "A": "I am just getting started and still learning the basics",
    "B": "I have intermediate skills and can work independently",
    "C": "I am experienced and can mentor or lead others in this area",
    "D": "I am an expert in my field with years of experience"
  }
}
    ''';

    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    surveys = jsonMap.entries.map((entry) {
      return Survey(
        question: entry.key,
        options: entry.value,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Survey'),
      ),
      body: ListView.builder(
        itemCount: surveys.length,
        itemBuilder: (context, index) {
          Survey survey = surveys[index];
          return ListTile(
            title: Text(survey.question),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: survey.options.entries.map((entry) {
                return RadioListTile<String>(
                  title: Text(entry.value), // Display the actual answer
                  value: entry.value,      // Store the actual answer
                  groupValue: _selectedValues[survey.question],
                  onChanged: (String? value) {
                    setState(() {
                      _selectedValues[survey.question] = value!;
                    });
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _validateAndSubmit,
        child: Icon(Icons.done),
      ),
    );
  }

  Map<String, String> _selectedValues = {}; // This will store the selected answers

  void _validateAndSubmit() async {
    // Check if all questions have been answered
    if (_selectedValues.length == surveys.length) {
      // If all questions are answered, proceed to submit the answers to Firestore
      await _submitSurvey();
    } else {
      // If some questions are not answered, show an alert
      _showIncompleteSurveyAlert();
    }
  }

  Future<void> _submitSurvey() async {
    try {
      // Create a reference for the current user's survey responses
      DocumentReference userSurveyRef = _firestore
          .collection('users')
          .doc(widget.userId)
          .collection('survey_responses')
          .doc();  // Automatically generate a new document ID for the response

      // Save the selected values (questions and answers) to Firestore
      await userSurveyRef.set(_selectedValues);


      // Navigate to the next screen
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UserProfileScreen()//here pass the actual values of these dynamiciables, for example false if the payment isn't successfull..etc
          ));
      _database.child('userID').set(FirebaseAuth.instance.currentUser!.uid);
      _database.child('isProcess').set("true");
    } catch (e) {
      print("Error submitting survey: $e");
      // Optionally, you can show an error message to the user
    }
  }

  void _showIncompleteSurveyAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Incomplete Survey"),
          content: Text("Please answer all the questions before proceeding."),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
