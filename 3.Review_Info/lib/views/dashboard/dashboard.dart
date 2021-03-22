import 'package:flutter/material.dart';
import 'dart:math';

import './../../models/data.dart';
import './widgets/review_card.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  int checkNumber(index) {
    if (index > data.length - 1) {
      return 0;
    }

    if (index < 0) {
      return data.length - 1;
    }

    return index;
  }

  void prevReview() {
    int prevIndex = checkNumber(currentIndex - 1);
    setState(() {
      currentIndex = prevIndex;
    });
  }

  void nextReview() {
    int nextIndex = checkNumber(currentIndex - 1);
    setState(() {
      currentIndex = nextIndex;
    });
  }

  void randomReview() {
    int randomNumber = Random().nextInt(data.length);
    if (randomNumber == currentIndex) {
      randomNumber = checkNumber(currentIndex + 1);
    }
    setState(() {
      currentIndex = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> reviews = data[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Our Reviews",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
            letterSpacing: 2,
            wordSpacing: 4,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF1F5F9),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xffF1F5F9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReviewCard(
                reviews['id'],
                reviews['name'],
                reviews['job'],
                reviews['image'],
                reviews['text'],
                prevReview,
                nextReview,
                randomReview,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
