import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String id;
  final String name;
  final String job;
  final String image;
  final String text;
  final Function prevReview;
  final Function nextReview;
  final Function randomReview;

  ReviewCard(
    this.id,
    this.name,
    this.job,
    this.image,
    this.text,
    this.prevReview,
    this.nextReview,
    this.randomReview,
  );

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      width: mq.width - 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff47A6E9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        width: 110,
                        height: 110,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 22,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff47A6E9),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      Icons.format_quote,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              job,
              style: TextStyle(
                color: Color(0xff70ABDB),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Color(0xffA8A9B0),
                fontSize: 14,
                wordSpacing: 1,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_left,
                ),
                onPressed: prevReview,
              ),
              IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_right,
                ),
                onPressed: nextReview,
              ),
            ],
          ),
          TextButton(
            onPressed: randomReview,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Color(0xffE9F7FF),
              ),
              child: Text('Suprise Me'),
            ),
          ),
        ],
      ),
    );
  }
}
