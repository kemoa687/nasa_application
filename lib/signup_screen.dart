import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nasa_application/survey_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nasa_application/auth_methods.dart';
import 'package:nasa_application/login_screen.dart';
import 'package:nasa_application/utils.dart';
import 'package:nasa_application/text_field_input.dart';
import 'package:firebase_database/firebase_database.dart';

final DatabaseReference _database = FirebaseDatabase.instance.reference();

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
    );
    if (res == "success") {
      setState(() {
        _isLoading = false;
      });
      _database.child('isProcess').set("false");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SurveyPage(userId: FirebaseAuth.instance.currentUser!.uid),
        ),
      );
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        child: Stack(
          children: [
            // Fullscreen background image
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/signup_back.jpg'), // Path to your background image
                  fit: BoxFit.fill,
                ),
              ),
            ),
            // The content of the signup screen
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                height: 550,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Make text stand out against background
                      ),
                    ),
                    SizedBox(height: 50),
                    TextFieldInput(
                      hintText: 'Enter your username',
                      textInputType: TextInputType.text,
                      textEditingController: _usernameController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldInput(
                      hintText: 'Enter your email',
                      textInputType: TextInputType.emailAddress,
                      textEditingController: _emailController,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFieldInput(
                      hintText: 'Enter your password',
                      textInputType: TextInputType.text,
                      textEditingController: _passwordController,
                      isPass: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: signUpUser,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          color: Colors.deepPurple,
                        ),
                        child: !_isLoading
                            ? const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        )
                            : const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Flexible(
                    //   child: Container(),
                    //   flex: 2,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.white), // White text for contrast
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 8),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text(
                              ' Login.',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // White text for contrast
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
