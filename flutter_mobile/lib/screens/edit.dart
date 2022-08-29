import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../env.sample.dart';
import '../models/student.dart';
import '../widgets/form.dart';

class Edit extends StatefulWidget {
  final Student student;

  const Edit({required this.student});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  // This is  for form validations
  final formKey = GlobalKey<FormState>();

  // This is for text onChange
  late TextEditingController nameController;
  late TextEditingController ageController;

  // Http post request
  Future editStudent() async {
    return await http.put(
      //"${Env.URL_PREFIX}/update.php",
      Uri.parse(Env.URL_PREFIX+widget.student.id.toString()),
      body: {
        //"id": widget.student.id.toString(),
        "name": nameController.text,
        "age": ageController.text
      },
    );
  }

  void _onConfirm(context) async {
    await editStudent();
    Navigator.of(context)
        .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
  }

  @override
  void initState() {
    nameController = TextEditingController(text: widget.student.name);
    ageController = TextEditingController(text: widget.student.age.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit"),
      ),
      bottomNavigationBar: BottomAppBar(
        child: RaisedButton(
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            _onConfirm(context);
          },
          child: const Text('CONFIRM'),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: AppForm(
              formKey: formKey,
              nameController: nameController,
              ageController: ageController,
            ),
          ),
        ),
      ),
    );
  }
}