import 'package:flutter/material.dart';

class ButtonAuth extends StatelessWidget {
  final String buttontext;
  final void Function()? onpressed;

  const ButtonAuth({Key? key, required this.buttontext, this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Color(0xfF2972FF),
      onPressed: onpressed,
      textColor: Colors.white,
      child: Text(buttontext),
    );
  }
}
