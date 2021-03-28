import 'package:flutter/material.dart';

class FormContainer extends StatefulWidget {
  final Function setNumber;

  FormContainer(this.setNumber);

  @override
  _FormContainerState createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _formKey = GlobalKey<FormState>();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String number;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffF1F5F9),
      height: 150,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.apps),
                      hintText: 'Length?',
                      labelText: 'Paragraph *',
                    ),
                    onSaved: (String value) => number = value,
                    validator: (value) {
                      if (value == null || value.isEmpty || !isNumeric(value)) {
                        return 'Please enter valid number.';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  widget.setNumber(number);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
