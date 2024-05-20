import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vcblry/model/words.dart';

Future<List<Word>> wordsListFromFirestore() async {
  var db = FirebaseFirestore.instance;

  List<Word> words = [];
  // List<Meaning> meanings = [];
  // List<String> translations = [];

  await db.collection("words").get().then((event) {
    // TODO: update data collecting according to the new Word Class model when done
    for (var doc in event.docs) {
      // Parse the data to Meaning Class

      // for (var type in doc.get('types')) {
      //   for (var trans in type['translations']) {
      //     translations.add(trans);
      //   }
      //   meanings.add(Meaning.parseMeaning(type['type'], translations));
      //   translations = [];
      // }

      // Parse the data to Word Class
      words.add(Word(value: doc.id));
    }
  });

  return words;
}
