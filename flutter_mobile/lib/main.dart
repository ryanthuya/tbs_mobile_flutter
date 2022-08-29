import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testing_with_rest_api/models/student.dart';

import './screens/home.dart';
import './screens/create.dart';
import './screens/edit.dart';

// void main() => runApp(App());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

late final Student student;

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Flutter with REST API',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/create': (context) => const Create(),
        '/edit': (context) => Edit(student:student),
      },
    );
  }
}