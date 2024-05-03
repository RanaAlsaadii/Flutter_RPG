import 'package:flutter/material.dart';
import 'package:flutter_rpg/models/character.dart';

import 'package:flutter_rpg/services/firestore_services.dart';

class CharacterProvider extends ChangeNotifier {
  final List<Character> _characters = [];

  get characters => _characters;

  // add character

  void addCharacter(Character character) {
    FirestoreService.addCharacter(character);
    _characters.add(character);
    notifyListeners();
  }

  // fetch characters in firestore

  void fetchCharactersOnce() async {
    if (characters.length == 0) {
      final snapshot = await FirestoreService.getCharactersOnce();

      for (var doc in snapshot.docs) {
        _characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  Future<void> saveCharacter(Character character) async {
    FirestoreService.updateCharacter(character);
    return;
  }

  Future<void> removeCharacter(Character character) async {
    FirestoreService.deleteDocument(character);
    _characters.remove(character);
    notifyListeners();
  }
}
