import 'package:firebase_practice/res/shared/constants.dart';
import 'package:firebase_practice/services/database.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Container(
            key: Key("AddTask"),
            child: Text('Add Task'),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            key: Key("AddtaskField"),
            controller: controller,
            decoration: textInputDecoration.copyWith(hintText: 'password'),
            obscureText: false,
            validator: (val) => val!.length < 0 ? 'Enter a task' : null,
          ),
          SizedBox(height: 12.0),
          RaisedButton(
              key: Key("Addtaskbutton"),
              color: Colors.pink[400],
              child: Text(
                'save',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                var result =
                    await DatabaseService().updateUserData(controller.text);
                Navigator.of(context).pop();
              }),
          Spacer(),
        ],
      ),
    );
  }
}
