import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vcblry/firebase_options.dart';
import 'package:vcblry/screens/words_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.dark(
            secondary: Colors.greenAccent,
            primary: Colors.deepPurple[500]!,
            tertiary: Colors.blue,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[500],
            foregroundColor: Colors.white,
          ))),
      home: const WordsListScreen(title: 'VCBLRY'),
    );
  }
}
