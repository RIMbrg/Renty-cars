import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:renty_cars/pages/Login.dart';
import 'package:renty_cars/pages/SignUp.dart';
import 'package:renty_cars/services/api_asma.dart';
import 'package:renty_cars/widgets/ButtonAuth.dart';
import 'package:renty_cars/widgets/InsertButton.dart';
import 'package:renty_cars/widgets/constants.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  var routing = MaterialPageRoute(builder: (context) => SignUp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tWhiteColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'lib/images/background.png'), // Path to your image
                  fit: BoxFit
                      .cover, // Adjust the image to cover the entire screen
                ),
              ),
            ),
            // Your content on top of the image
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Column(
                    children: [
                      SizedBox(height: 130),
                      SizedBox(
                        width: double.infinity,
                        child: Image(
                            image: AssetImage('lib/images/logo_renty_car.png')),
                      ),
                    ],
                  ),
                  Column(
                    children: [
// //Api Button
//                       insertButton(
//                           label: "get Api",
//                           action: () async {
//                             var res = await ApiServices().getRequest();
//                             print(res[2]);
//                           }),
//                       const SizedBox(height: 20),
//Login button
                      const SizedBox(height: 50),
                      ButtonAuth(
                        buttontext: 'LOG IN',
                        onpressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                      ),
// SIGN UP Button
                      SizedBox(height: 20),
                      ButtonAuth(
                        buttontext: 'SIGN UP',
                        onpressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                      ),
//Skip Button
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("home");
                        },
                        child: const Text.rich(
                          TextSpan(
                              text: " Skip",
                              style: TextStyle(color: Colors.white)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      const SizedBox(height: 20),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
