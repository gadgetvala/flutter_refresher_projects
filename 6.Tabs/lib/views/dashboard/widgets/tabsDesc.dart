import 'package:flutter/material.dart';

class TabsDesc extends StatelessWidget {
  final String title;
  final String dates;
  final List duties;
  final String company;

  TabsDesc(
    this.title,
    this.dates,
    this.duties,
    this.company,
  );

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.only(left: 12.0),
            decoration: BoxDecoration(
              color: Color(0xffDAE2EC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                company,
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  color: Color(0xff647D98),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Text(
              dates,
              style: TextStyle(
                fontSize: 16,
                letterSpacing: 2,
                color: Color(0xff627DA0),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: duties.length,
              itemBuilder: (_, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.double_arrow, color: Color(0xff2CAEBA)),
                    Container(
                      width: mq.width - 60,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        duties[index],
                        style: TextStyle(
                          color: Color(0xff324D68),
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
