import 'package:flutter/material.dart';

class SuperScriptText extends StatelessWidget {
  const SuperScriptText({
    super.key,
    required this.text,
    required this.superScript,
    required this.color,
    required this.superScriptColor,
  });

  final String text;
  final String superScript;
  final Color color;
  final Color superScriptColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          superScript,
          style: TextStyle(
            color: superScriptColor,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
