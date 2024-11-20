// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:renty_cars/widgets/OldWidgets/InputFile.dart';
import 'package:renty_cars/widgets/InsertButton.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';

class OldLoginPage extends StatefulWidget {
  const OldLoginPage({super.key});

  @override
  State<OldLoginPage> createState() => _OldLoginPageState();
}

class _OldLoginPageState extends State<OldLoginPage> {
  @override
  // void initState() {
  //   FirebaseAuth.instance.authStateChanges().listen((User? user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //       Navigator.of(context).pushNamed('home');
  //     }
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        appBar: MyAppBar(pageTitle: "  "),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Column(children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Login to your account',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 133, 134, 134),
                          ),
                        )
                      ]),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          children: [
                            inputFile(label: "Email"),
                            inputFile(label: "Password", obscureText: true),
                          ],
                        ),
                      ),
                      insertButton(label: 'Login', action: () {}),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account? "),
                          Text(
                            "_ Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/background.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      )
                    ]),
              )
            ],
          ),
        ));
  }
}
