import 'package:flutter/material.dart';

import './widgets/question.dart';
import './../../models/data.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Accordion",
          style: TextStyle(
            fontSize: 30,
            letterSpacing: 3,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xff4B145B),
      ),
      body: Container(
        color: Color(0xff4B145B),
        child: Container(
          margin: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Question & Answer About Login',
                  style: TextStyle(
                    fontSize: 28,
                    letterSpacing: 2,
                    wordSpacing: 1,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (_, index) {
                    return Question(
                      title: questions[index]['title'],
                      info: questions[index]['info'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
