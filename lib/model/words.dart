class Word {
  final String value;
  Word({required this.value});
  // TODO: update Word class model including definition, translation, sentences, etc.
}



// class Word {
//   final String value;
//   final List<Meaning> meanings;
// // TODO: Implement type of word with an int field [noun, verb, adjective, adverb, expression]
// // final int;

//   Word({required this.value, required this.meanings});

//   static parseWord(String value, List<Meaning> meanings) {
//     return Word(value: value, meanings: meanings);
//   }
// }

// class Meaning {
//   final String type;
//   final List<String> translations, sentences;

//   Meaning(
//       {required this.type,
//       required this.translations,
//       this.sentences = const []});

//   static parseMeaning(String type, List<String> translation) {
//     return Meaning(type: type, translations: translation);
//   }
// }