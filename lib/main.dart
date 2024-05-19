import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:vcblry/firebase_options.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.dark(secondary: Colors.deepPurple[500]!)),
      home: const MyHomePage(title: 'VCBLRY'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _wordController = TextEditingController();
  void _addWord() async {
    String word = _wordController.text;
    if (word.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('words')
          .doc(word)
          .set({'word': word});
      _wordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Word added: $word')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.title, style: const TextStyle(fontSize: 30)),
      )),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
            controller: _wordController,
            decoration: const InputDecoration(
              labelText: 'Enter a word',
            )),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWord,
        tooltip: 'Add word',
        child: const Icon(Icons.add),
      ),
    );
  }
}
