import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String imagepath;
  const SocialButton({Key? key, required this.imagepath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      // minWidth: double.infinity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      onPressed: () {},
      child: Image.asset(
        imagepath,
        width: 40,
      ),
    );
  }
}
