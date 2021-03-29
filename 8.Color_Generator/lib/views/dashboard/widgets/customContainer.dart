import 'dart:async';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

class CustomContainer extends StatefulWidget {
  final String hexCode;
  final String percentage;
  final int index;

  CustomContainer(
    this.hexCode,
    this.percentage,
    this.index,
  );

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool showCopied = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          showCopied = true;
        });
        FlutterClipboard.copy(widget.hexCode);
        Timer(Duration(seconds: 3), () {
          setState(() {
            showCopied = false;
          });
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${widget.percentage}%',
            style: TextStyle(
              color: widget.index > 5 ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            widget.hexCode,
            style: TextStyle(
              color: widget.index > 5 ? Colors.white : Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          if (showCopied)
            Text(
              'Copied to clipboard',
              style: TextStyle(
                color: widget.index > 5 ? Colors.white : Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
