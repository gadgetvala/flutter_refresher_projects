import 'package:flutter/material.dart';
import './customContainer.dart';

class ColorPalateContainer extends StatelessWidget {
  final List colorArray;

  ColorPalateContainer(this.colorArray);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: colorArray.length,
      itemBuilder: (_, index) {
        return Container(
          height: 150,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: colorArray[index]['color'],
            borderRadius: BorderRadius.circular(5),
          ),
          child: CustomContainer(
            colorArray[index]['hexCode'],
            (colorArray[index]['percentage'] * 2).toString(),
            index,
          ),
        );
      },
    );
  }
}
