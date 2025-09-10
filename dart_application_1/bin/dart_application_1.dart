import 'dart:io';
import 'package:dart_application_1/dart_application_1.dart'
    as dart_application_1;

// List of words for Hangman game

List<String> hangmanWords = [
  'Banana',
  'Ear',
  'Apple',
  'Blue',
  'Destruction',
  'Security',
  'Cat',
];

void main(List<String> arguments) {
  String randomWord = hangmanWords[0];
  String letterSpace = "";
  int letterUsed = 0;
  int lives = 6;
  int loopCheck = 0;
  List<String> letterGuess = List.filled(randomWord.length, '*');

  print('Welcome to Hangman! Let\'s start playing.');
  print('Current word: ' + letterGuess.join(' '));

  while (letterGuess.join('') != randomWord && lives > 0) {
    print('Guess a letter:');
    String? guess = stdin.readLineSync();
    if (guess == null || guess.length != 1) {
      print('Please enter a single character.');
      continue;
    }

    // If input already in letterSpace
    if (letterSpace.contains(guess)) {
      print('You already guessed that letter. Try again.');
      continue;
    }

    // If input is alphabet/capital (without regex)
    int code = guess.codeUnitAt(0);
    if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122)) {
      // Valid input
      letterSpace += guess;
      // ...existing game logic here (update letterGuess, lives, etc)...
      print('Valid input: $guess');
    } else {
      print('Incorrect character, retry');
      continue;
    }
    // ...existing code for updating game state...
  }
}
