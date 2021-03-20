import 'package:flutter/material.dart';

class Controlls extends StatelessWidget {
  final Function removeDataFromAppData;
  final Function takeDataFromUser;

  Controlls(this.takeDataFromUser, this.removeDataFromAppData);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        TextButton(
          onPressed: () async {
            await takeDataFromUser(context);
          },
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
