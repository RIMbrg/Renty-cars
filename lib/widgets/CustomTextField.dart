import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String fieldname;
  final String hinttext;
  final TextEditingController mycontroller;

  const CustomTextField(
      {Key? key,
      required this.fieldname,
      required this.hinttext,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(fieldname,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.deepOrange)),
      const SizedBox(height: 10),
      TextFormField(
          controller: mycontroller,
          decoration: InputDecoration(
              hintText: hinttext,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
              filled: true,
              fillColor: Colors.grey[100],
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 219, 219, 219))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey)))),
    ]);
  }
}
