import 'rpg_game.dart';

enum SuperAbility { criticalDamage, boosting, healing, blockRevert }


abstract class GameCharacter {
  String name;
  int _health;
  int damage;

  GameCharacter(this.name, this._health, this.damage);

  int get health => _health;

  set health(int value) {
    if (value < 0) {
      _health = 0;
    } else {
      _health = value;
    }
  }

  bool isAlive() {
    return _health > 0;
  }

  @override
  String toString() {
    return '${runtimeType.toString()} $name health: $health damage: $damage';
  }
}

class Boss extends GameCharacter {
  SuperAbility? defence;

  Boss(super.name, super.health, super.damage);

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

      void attack(List<Hero> heroes) {
    GameCharacter? aliveGolem;
    for (var h in heroes) {
      if (h.runtimeType.toString() == 'Golem' && h.isAlive()) {
        aliveGolem = h;
        break;
      }
    }

    for (var hero in heroes) {
      if (hero.isAlive()) {
        if (hero is Deft && RpgGame.random.nextInt(100) < 25) {
          print('${hero.name} dodged atack!');
          continue;
        }
        if (hero.runtimeType.toString() == 'Golem') {
          hero.health -= damage;
          
          if (!hero.isAlive() && hero.runtimeType.toString() == 'Bomber') {
            print('${hero.name} exploded and dealt 100 damage to the Boss!');
            this.health -= 100;
          }
          continue;
        }

        int finalDamage = damage;
        if (aliveGolem != null) {
          int redirected = damage ~/ 5;
          finalDamage = damage - redirected;
          aliveGolem.health -= redirected;
        }

        if (hero is Berserk && defence != SuperAbility.blockRevert) {
          int block = (RpgGame.random.nextInt(2) + 1) * 5;
          hero.blockedDamage = block;
          hero.health -= (finalDamage - block);
        } else {
          hero.health -= finalDamage;
        }

        // Проверка смерти Бомбера после получения урона
        if (!hero.isAlive() && hero.runtimeType.toString() == 'Bomber') {
          print('${hero.name} exploded and dealt 100 damage to the Boss!');
          this.health -= 100;
        }
      }
    }
  }



  @override
  String toString() {
    String d = 'No defence';
    if (defence != null) {
      d = defence!.name;
    }
    return '${super.toString()} defence: $d';
  }
}

abstract class Hero extends GameCharacter {
  SuperAbility ability;

  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = damage * (RpgGame.random.nextInt(5) + 2); // 2,3,4,5,6
    boss.health -= crit;
    print('Warrior $name hit critically $crit');
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Deft extends Hero {
  Deft(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boosting);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    print('Golem $name tankedd damage');
  }
}

class Bomber extends Hero {
  Bomber(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boosting);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}


class Medic extends Hero {
  int healPoints;
  Medic(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.healing);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && name != hero.name) {
        hero.health += healPoints;
      }
    }
  }
}