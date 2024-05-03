import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rpg/models/skill.dart';
import 'package:flutter_rpg/models/stats.dart';
import 'package:flutter_rpg/models/vocation.dart';

class Character with Stats {
  //fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  //underscore means private attribute we can't make any changes out of this class :)
  bool _isFav = false;

  //constructor

  Character(
      {required this.name,
      required this.slogan,
      required this.vocation,
      required this.id});

//getters

  bool get isFave => _isFav;

  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }

  // character to firestore (map)

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'slogan': slogan,
      'isFav': _isFav,
      'vocation': vocation.toString(),
      'skills': skills.map((s) => s.id).toList(),
      'stats': statsAsMap,
      'points': points
    };
  }

  // firestore to character we do a factory abject

  factory Character.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? option) {
    //get data from firestore

    final data = snapshot.data()!;

    //make character instance

    Character character = Character(
        name: data['name'],
        slogan: data['name'],
        vocation:
            Vocation.values.firstWhere((v) => v.toString() == data['vocation']),
        id: snapshot.id);

    //update skills

    for (String id in data['skills']) {
      Skill skill = allSkills.firstWhere((s) => s.id == id);

      character.updateSkill(skill);
    }

    // set isFav

    if (data["isFav"] == true) {
      character.toggleIsFav();
    }

    // assign stats and points

    character.setStats(points: data["points"], stats: data["stats"]);

    return character;
  }
}

List<Character> characters = [
  Character(
      id: '1', name: 'Klara', vocation: Vocation.wizard, slogan: 'Kapumf!'),
  Character(
      id: '2',
      name: 'Jonny',
      vocation: Vocation.junkie,
      slogan: 'Light me up...'),
  Character(
      id: '3',
      name: 'Crimson',
      vocation: Vocation.raider,
      slogan: 'Fire in the hole!'),
  Character(
      id: '4',
      name: 'Shaun',
      vocation: Vocation.ninja,
      slogan: 'Alright then gang.'),
];
