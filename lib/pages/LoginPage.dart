import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:renty_cars/widgets/ButtonAuth.dart';
import 'package:renty_cars/widgets/CustomTextField.dart';
import 'package:renty_cars/widgets/LogoAuth.dart';
import 'package:renty_cars/widgets/MyAppBar.dart';
import 'package:renty_cars/widgets/SocialButton.dart';
import 'package:renty_cars/widgets/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        Text('Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: tSecondaryColor)),
                        SizedBox(height: 10),
                        Text('Login to continue using the app',
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                      obscure: false,
                      fieldname: 'Email',
                      hinttext: "Enter your Email",
                      mycontroller: email),
                  const SizedBox(height: 10),
                  CustomTextField(
                      obscure: false,
                      fieldname: 'Password',
                      hinttext: "Enter your Password",
                      mycontroller: password),
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
                onpressed: () {},
              ),
              const SizedBox(height: 20),
              const Text(
                'Or Login with',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialButton(imagepath: 'lib/images/google.png'),
                  SizedBox(
                    width: 10,
                  ),
                  SocialButton(imagepath: 'lib/images/facebook.png'),
                ],
              ),
              const SizedBox(height: 50),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("signup");
                },
                child: const Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "Don't have an account?"),
                    TextSpan(
                        text: " Sign up",
                        style: TextStyle(color: Color(0xFF2972FF)))
                  ]),
                  textAlign: TextAlign.center,
                ),
              ),
            ])),
      ),
    );
  }
}
