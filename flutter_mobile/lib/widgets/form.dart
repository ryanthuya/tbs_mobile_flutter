import 'package:flutter/material.dart';
import 'dart:core';

class AppForm extends StatefulWidget {
  // Required for form validations
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Handles text onchange
  TextEditingController nameController;
  TextEditingController ageController;

  AppForm({required this.formKey, required this.nameController, required this.ageController});

  @override
  _AppFormState createState() => _AppFormState();
}

class _AppFormState extends State<AppForm> {
  String? _validateName(String value) {
    if (value.length < 3) return 'Name must be more than 2 charater';
    return null;
  }

  String? _validateAge(String value) {

    //Updated COMMNET
    // Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)';
    // RegExp regex = new RegExp(pattern);
    // if (!regex.hasMatch(value)) return 'Age must be a number';

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.always, key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: widget.nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Name'),
            //validator: _validateName, //  COMMENT
          ),
          TextFormField(
            controller: widget.ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Age'),
            //validator: _validateAge,  //COMMNET
          ),
        ],
      ),
    );;
  }
}