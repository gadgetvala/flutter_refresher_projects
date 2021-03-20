import 'package:flutter/material.dart';

class Controlls extends StatelessWidget {
  final Function removeDataFromAppData;

  Controlls(this.removeDataFromAppData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            'Add',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xffF289B1),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            removeDataFromAppData('null', 'all');
          },
          child: Text(
            'Clear All',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xffF289B1),
            ),
          ),
        ),
      ],
    );
  }
}
