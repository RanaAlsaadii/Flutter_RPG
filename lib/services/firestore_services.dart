import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/character.dart';

class FirestoreService {
  static final ref = FirebaseFirestore.instance
      .collection("characters")
      .withConverter(
          fromFirestore: Character.fromFirestore,
          toFirestore: (Character c, _) => c.toFirestore());

  // add character
  static Future<void> addCharacter(Character character) async {
    await ref.doc(character.id).set(character);
  }

  //get character

  static Future<QuerySnapshot<Character>> getCharactersOnce() {
    return ref.get();
  }

  static Future<void> updateCharacter(Character character) async {
    await ref.doc(character.id).update({
      'stats': character.statsAsMap,
      'points': character.points,
      'skills': character.skills.map((s) => s.id).toList(),
      'isFav': character.isFave
    });
  }

  static Future<void> deleteDocument(Character character) async {
    ref.doc(character.id).delete();
  }
}
