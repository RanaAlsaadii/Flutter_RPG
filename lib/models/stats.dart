mixin Stats {
  int _point = 10;
  int _health = 10;
  int _attack = 10;
  int _defense = 10;
  int _skill = 10;

//getters

  int get points => _point;
  Map<String, int> get statsAsMap => {
        "health": _health,
        "attack": _attack,
        "defense": _defense,
        "skill": _skill
      };

  List<Map<String, String>> get statsAsFormatedList => [
        {"title": "health", "value": _health.toString()},
        {"title": "attack", "value": _attack.toString()},
        {"title": "defense", "value": _defense.toString()},
        {"title": "skill", "value": _skill.toString()}
      ];
//methods
  void increaseStat(String stat) {
    if (_point > 0) {
      if (stat == 'health') {
        _health++;
      }
      if (stat == 'attack') {
        _attack++;
      }
      if (stat == 'defense') {
        _defense++;
      }
      if (stat == 'skill') {
        _skill++;
      }
      _point--;
    }
  }

  void decreaseStat(String stat) {
    if (stat == 'health' && _health > 5) {
      _health--;
      _point++;
    }

    if (stat == 'attack' && _attack > 5) {
      _attack--;
      _point++;
    }

    if (stat == 'defense' && _defense > 5) {
      _defense--;
      _point++;
    }

    if (stat == 'skill' && _skill > 5) {
      _skill--;
      _point++;
    }
  }

  void setStats({required int points, required Map<String, dynamic> stats}) {
    _point = points;

    _health = stats["health"];
    _attack = stats["attack"];
    _defense = stats["defense"];
    _skill = stats["skill"];
  }
}
