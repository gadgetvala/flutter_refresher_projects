import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final Function setCode;

  InputForm(this.setCode);

  @override
  _InputFormState createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  final _formKey = GlobalKey<FormState>();
  final RegExp isHexColor = RegExp(r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$');
  String hexCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      color: Color(0xffF1F5F9),
      child: Form(
        key: _formKey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 200,
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  icon: Icon(Icons.code_outlined),
                  hintText: '#65177e',
                  labelText: 'HexCode *',
                ),
                onSaved: (String value) => hexCode = value,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length <= 6 ||
                      !isHexColor.hasMatch(value)) {
                    return 'Please enter valid hexcode.';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  widget.setCode(hexCode);
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
