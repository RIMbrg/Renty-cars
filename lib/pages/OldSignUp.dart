import 'package:flutter/material.dart';

import 'package:renty_cars/widgets/InputFile.dart';
import 'package:renty_cars/widgets/InsertButton.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/constants.dart';

class OldSignUpPage extends StatefulWidget {
  const OldSignUpPage({super.key});

  @override
  State<OldSignUpPage> createState() => _OldSignUpPageState();
}

class _OldSignUpPageState extends State<OldSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: tWhiteColor,
      appBar: MyAppBar(
        pageTitle: "  ",
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Column(
                children: [
                  Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create an account',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 133, 134, 134),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  inputFile(label: "Username"),
                  inputFile(label: "Email"),
                  inputFile(label: "Password", obscureText: true),
                  inputFile(label: "Confirm password", obscureText: true),
                ],
              ),
              insertButton(label: "Sign up", action: () {}),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  Text(
                    " Login",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

      // body: Center(
      //   child: Column(children: [
      //     Container(
      //         padding: EdgeInsets.all(10),
      //         child: const Text(
      //           'Sign up',
      //           style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
      //         )),
      //     const Text('Create your account',
      //         style: TextStyle(color: Colors.grey)),
      //     TextField(
      //       decoration: InputDecoration(labelText: 'User name'),
      //     ),
      //     const Text('Password')
      //   ]),
      // ),
    );
  }
}
