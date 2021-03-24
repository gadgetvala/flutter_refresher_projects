import 'package:flutter/material.dart';

class Question extends StatefulWidget {
  final String title;
  final String info;

  Question({
    @required this.title,
    @required this.info,
  });

  @override
  _QuestionState createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  bool showText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 210,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: showText
                    ? Icon(Icons.remove_circle)
                    : Icon(Icons.add_circle),
                color: Color(0xff4A145A),
                iconSize: 28,
                onPressed: () => setState(() => showText = !showText),
              ),
            ],
          ),
          if (showText)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.info,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
