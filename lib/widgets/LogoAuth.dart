import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Center(
          child: Container(
            // padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 150,
            height: 150,
            // color: Colors.grey[200],
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200]),
            child: Image.asset(
              'lib/images/Renty-logo.jpg',
              height: 150,
            ),
          ),
        )
      ],
    );
  }
}
