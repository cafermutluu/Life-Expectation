import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({super.key, this.genderIcon, this.genderText});

  final IconData? genderIcon;
  final String? genderText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(genderIcon, size: 40, color: Colors.black45),
        Text(
          genderText!,
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
