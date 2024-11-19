import 'package:flutter/material.dart';
import 'package:renty_cars/widgets/constants.dart';

class ButtonAuth extends StatelessWidget {
  final String buttontext;
  final void Function()? onpressed;
  final Color? TextColor;
  final Color? ButtonColor;

  const ButtonAuth(
      {Key? key,
      required this.buttontext,
      this.onpressed,
      this.ButtonColor,
      this.TextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,

      shape: RoundedRectangleBorder(
        // side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: ButtonColor,

      onPressed: onpressed,
      textColor: TextColor,
      child: Text(
        buttontext,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
