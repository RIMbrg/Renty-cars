import 'package:flutter/material.dart';


Widget insertButton({label, action, butColor, txtColor}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 40),
    child: MaterialButton(
      minWidth: double.infinity,
      height: 60,
      onPressed: action,
      color: butColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
        side: const BorderSide(color: Colors.black),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Color.fromARGB(255, 153, 46, 46),
        ),
      ),
    ),
  );
}
