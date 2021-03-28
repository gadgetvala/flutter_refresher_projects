import 'package:flutter/material.dart';

class DisplayContainer extends StatelessWidget {
  final String text;

  DisplayContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF1F5F9),
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
