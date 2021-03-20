import 'package:flutter/material.dart';

class BirthdayHeader extends StatelessWidget {
  final String text;

  BirthdayHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      padding: const EdgeInsets.only(
        top: 15,
        left: 20,
      ),
      child: RichText(
        text: TextSpan(
          text: '$text ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xffF289B1),
          ),
          children: <TextSpan>[
            TextSpan(
              text: 'birthday today.',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
