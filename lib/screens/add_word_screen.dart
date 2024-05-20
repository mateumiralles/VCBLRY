import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vcblry/components/custom_snack_bar.dart';

class AddWordScreen extends StatelessWidget {
  const AddWordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController wordController = TextEditingController();
    void addWord() async {
      String word = wordController.text;
      if (word.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('words')
            .doc(word)
            .set({'word': word});
        wordController.clear();

        if (!context.mounted) return;
        ScaffoldMessenger.of(context)
            .showSnackBar(customSnackBar(text: 'New word added: $word'));
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Word'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: TextField(
                autofocus: true,
                controller: wordController,
                decoration: const InputDecoration(
                  labelText: 'Enter a word',
                )),
          ),
          const SizedBox(
            height: 100,
          ),
          ElevatedButton(
            onPressed: addWord,
            child: const Text('Add word'),
          )
        ],
      ),
    );
  }
}
