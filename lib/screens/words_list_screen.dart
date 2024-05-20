import 'package:flutter/material.dart';
import 'package:vcblry/functions/load_words_list.dart';
import 'package:vcblry/model/words.dart';
import 'package:vcblry/screens/add_word_screen.dart';

class WordsListScreen extends StatefulWidget {
  const WordsListScreen({super.key, required this.title});

  final String title;

  @override
  State<WordsListScreen> createState() => _WordsListScreenState();
}

class _WordsListScreenState extends State<WordsListScreen> {
  void navigateAddWord() async {
    Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const AddWordScreen())) //reload the list when comming back from AddWordScreen
        .then((_) => setState(() {
              loadList();
            }));
  }

  List<Word> wordsList = [];
  bool loaded = false;

  @override
  void initState() {
    loadList();

    super.initState();
  }

  void loadList() async {
    wordsList = await wordsListFromFirestore();

    //Sort the wordsList alphabetically.
    wordsList.sort((a, b) => (a.value).compareTo(b.value));
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text(widget.title, style: const TextStyle(fontSize: 30)),
      )),
      body: loaded
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                  itemCount: wordsList.length,
                  itemBuilder: (BuildContext context, int i) {
                    return GestureDetector(
                      onTap: () =>
                          print('This word value is: ${wordsList[i].value}'),
                      child: Card(
                        color: Colors.grey[850],
                        child: ListTile(
                          title: Center(
                            child: Text(wordsList[i].value),
                          ),
                        ),
                      ),
                    );
                  }),
            )
          : const CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateAddWord,
        tooltip: 'Add word',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
