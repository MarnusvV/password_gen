import 'package:flutter/material.dart';
import 'dart:math' show Random;
import 'package:random_string/random_string.dart';

class PasswordGenerator extends StatefulWidget {
  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String userName = 'Password';
  String password = randomString(9);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter user name',
                    ),
                    controller: controller,
                    onSubmitted: (String value) {
                      userName = value;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TextButton(
                          child: Text('New Password'),
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('Your new password'),
                                content: Text(
                                  password,
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }),
                      SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
