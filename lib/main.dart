import 'package:flutter/material.dart';
import 'package:counter_app_tdd/Presentation/counter_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final int number = 1 ;
   @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Counter App Example',
    theme: ThemeData(
      primaryColor: Colors.red.shade800,
      accentColor: Colors.red.shade600,
    ),
    debugShowCheckedModeBanner: false,
    home: CounterPage(),
  );
}
}