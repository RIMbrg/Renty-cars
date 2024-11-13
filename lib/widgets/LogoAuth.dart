import 'package:flutter/material.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 80,
            height: 80,
            // color: Colors.grey[200],
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200]),
            child: Image.asset(
              'lib/images/logo_renty_car.png',
              height: 50,
            ),
          ),
        )
      ],
    );
  }
}
