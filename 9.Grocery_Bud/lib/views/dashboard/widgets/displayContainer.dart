import 'package:flutter/material.dart';

class DisplayContainer extends StatelessWidget {
  final List<Map<String, String>> data;
  final Function deleteData;
  final Function setEditing;

  DisplayContainer({
    @required this.data,
    @required this.deleteData,
    @required this.setEditing,
  });

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, index) {
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  width: mq.width * 0.6,
                  height: 30,
                  padding: const EdgeInsets.all(5),
                  child: Text(
                    data[index]['text'],
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green,
                      ),
                      onPressed: () =>
                          setEditing('start', data[index]['id'], ''),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => deleteData(data[index]['id']),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
