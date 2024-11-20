import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:renty_cars/widgets/ButtonAuth.dart';
import 'package:renty_cars/widgets/CustomTextField.dart';
import 'package:renty_cars/widgets/LogoAuth.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

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
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LogoAuth(),
                  const SizedBox(height: 10),
                  const Center(
                    child: Column(
                      children: [
                        Text('Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.deepOrange)),
                        SizedBox(height: 10),
                        Text('Enter your personal informations',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      obscure: false,
                      fieldname: 'Username',
                      hinttext: "Enter your username",
                      mycontroller: username),
                  CustomTextField(
                      obscure: false,
                      fieldname: 'Email',
                      hinttext: "Enter your Email",
                      mycontroller: email),
                  CustomTextField(
                    obscure: true,
                    fieldname: 'Password',
                    hinttext: "Enter your Password",
                    mycontroller: password,
                    // obscureText: true,
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
                buttontext: 'Sign Up',
                ButtonColor: tAccentColor,
                TextColor: tWhiteColor,
                onpressed: () async {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    );
                    Navigator.of(context).pushReplacementNamed("home");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("login");
                },
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "Have an account?"),
                    TextSpan(
                        text: " Login",
                        style: TextStyle(color: Color(0xFF2972FF)))
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
            ])),
      ),
    );
  }
}
