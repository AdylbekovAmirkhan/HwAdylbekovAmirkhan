import 'game_characters.dart';
import 'dart:math';

class RpgGame {
  static Random random = Random();
  static int roundNumber = 0;

  static void startGame() {
    Boss boss = Boss('Headless Cuirassierman', 1350, 50);

    Warrior warrior1 = Warrior('Mercenary Bob III.', 270, 15);
    Warrior warrior2 = Warrior('Mercenary Bob jr.', 280, 10);
    Berserk berserk = Berserk('Bob Namesake)', 260, 15);
    Medic doc = Medic('Doctor Bob sr.', 250, 5, 15);
    Medic assistant = Medic('Bobswife', 300, 5, 5);
    Golem golem = Golem("Bob the Stoneman", 700, 4);
    Deft Thief = Deft("Robbery Bob IV", 220, 100);
    Bomber Bomberman = Bomber("Grenadier Bobigton", 100, 4);
    List<Hero> heroes = [warrior1, doc, berserk, warrior2, assistant, golem, Thief, Bomberman];

    _printStatisticts(boss, heroes);

    while (!_isGameOver(boss, heroes)) {
      _playRound(boss, heroes);
    }
  }

  static bool _isGameOver(Boss boss, List<Hero> heroes) {
    if (!boss.isAlive()) {
      print('Heroes won!!!');
      return true;
    }
    bool allHeroesDead = true;
    for (var hero in heroes) {
      if (hero.isAlive()) {
        allHeroesDead = false;
        break;
      }
    }
    if (allHeroesDead) {
      print('Boss won!!!');
      return true;
    }
    return false;
  }

  static void _playRound(Boss boss, List<Hero> heroes) {
    roundNumber++;
    boss.chooseDefence();
    boss.attack(heroes);
    for (var hero in heroes) {
      if (hero.isAlive() && boss.isAlive() && hero.ability != boss.defence) {
        hero.attack(boss);
        hero.applySuperPower(boss, heroes);
      }
    }
    _printStatisticts(boss, heroes);
  }

  static void _printStatisticts(Boss boss, List<Hero> heroes) {
    print('ROUND $roundNumber --------------');
    print(boss);
    for (var hero in heroes) {
      print(hero);
    }
  }
}