import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class DetailCard extends StatefulWidget {
  final String id;
  final String name;
  final String price;
  final String imageLink;
  final String detailText;
  final Function removeData;

  DetailCard(
    this.id,
    this.name,
    this.price,
    this.imageLink,
    this.detailText,
    this.removeData,
  );

  @override
  _DetailCardState createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  bool isRead = false;

  void setIsRead() {
    setState(() {
      isRead = !isRead;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      // height: mq.height * 0.3,
      width: mq.width - 30,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.network(
            widget.imageLink,
            width: mq.width - 30,
            height: mq.height * 0.15,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xffEEF5FE),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                      "\$${widget.price}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff5AA6E3),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              child: RichText(
                text: TextSpan(
                  text: isRead
                      ? '  ${widget.detailText}'
                      : '${widget.detailText.substring(0, 200)}...',
                  style: TextStyle(
                    color: Color(0xff808080),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text: isRead ? 'Show Less' : 'Read More',
                      style: TextStyle(
                        color: Color(0xff5AA6E3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => setIsRead(),
                    )
                  ],
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  widget.removeData(widget.id);
                },
                child: Text(
                  "Not Intrested",
                  style: TextStyle(
                    color: Colors.redAccent,
                    letterSpacing: 1.2,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
