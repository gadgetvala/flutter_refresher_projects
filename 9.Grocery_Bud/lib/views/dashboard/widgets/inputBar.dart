import 'package:flutter/material.dart';

class InputBar extends StatefulWidget {
  final Function setData;

  InputBar({
    @required this.setData,
  });

  @override
  _InputBarState createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  String text;

  @override
  Widget build(BuildContext context) {
    Size mq = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: 80,
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: mq.width * 0.6,
              color: Color(0xffEFF3F6),
              child: TextFormField(
                controller: _textController..text = '',
                onSaved: (String value) => text = value,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Value can`t be empty.';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFF3F6), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xffEFF3F6), width: 2.0),
                  ),
                  contentPadding:
                      new EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  hintText: 'e.g. Eggs',
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffA2D3F5),
                borderRadius: BorderRadius.circular(5),
              ),
              child: InkWell(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    _textController.clear();
                    widget.setData(text);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
