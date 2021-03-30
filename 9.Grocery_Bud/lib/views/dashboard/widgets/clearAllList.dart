import 'package:flutter/material.dart';

class ClearAllList extends StatelessWidget {
  final Function clearList;

  ClearAllList({
    @required this.clearList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => clearList(),
      child: Container(
        width: double.infinity,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.clear_all,
              color: Colors.red,
            ),
            Text(
              "Clear Items",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
