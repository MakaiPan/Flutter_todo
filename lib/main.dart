import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/models/task.dart';
import 'package:todo/pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox(kTaskBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePages(),
      debugShowCheckedModeBanner: false,
    );
  }
}
