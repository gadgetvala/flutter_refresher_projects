import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

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
          child: InkWell(
            onTap: () {
              FlutterClipboard.copy(colorArray[index]['hexCode'])
                  .then((value) => print('copied'));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${(colorArray[index]['percentage'] * 2).toString()}%',
                  style: TextStyle(
                    color: index > 5 ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  colorArray[index]['hexCode'],
                  style: TextStyle(
                    color: index > 5 ? Colors.white : Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
