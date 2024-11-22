// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'package:flutter/material.dart';
import 'package:renty_cars/widgets/ButtonAuth.dart';
import 'package:renty_cars/widgets/CustomTextField.dart';
import 'package:renty_cars/widgets/LogoAuth.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/constants.dart';
import 'package:renty_cars/widgets/navbar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String _userRole = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: tWhiteColor,
      appBar: const MyAppBar(
        pageTitle: "  ",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 10),
                  const Center(
                    child: Column(
                      children: [
                        Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.deepOrange)),
                        SizedBox(height: 10),
                        Text('Enter your login ',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      fieldname: 'Email',
                      hinttext: "Enter your Email",
                      mycontroller: email),
                  const SizedBox(height: 10),
                  CustomTextField(
                      fieldname: 'Password',
                      hinttext: "Enter your Password",
                      mycontroller: password,
                      ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    alignment: Alignment.topRight,
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              ButtonAuth(
                buttontext: 'Login',
                ButtonColor: tAccentColor,
                TextColor: tWhiteColor,
                onpressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );

                    // Fetch the role from Firestore
                    final userDoc = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(credential.user!.uid)
                        .get();

                    if (userDoc.exists) {
                      _userRole = userDoc['role']; // Fetch user role

                      // Navigate based on role
                      if (_userRole == 'User') {
                         Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const   NavBarPage()),
                        );
                      } else if (_userRole == 'Agent') {
                       
                      }
                    } else {
                      // Handle the case when user document is not found
                      print('User document not found');
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("signup");
                },
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "Don't have an account?"),
                    TextSpan(
                        text: " Sign Up",
                        style: TextStyle(color: Color(0xFF2972FF)))
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

