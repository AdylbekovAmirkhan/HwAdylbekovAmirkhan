import 'adjustable.dart';
import 'batteryPowered.dart';
import 'device.dart';

class smartspeaker extends Device with BatteryPowered implements Adjustable {
  int volume;

  smartspeaker(super.name, this.volume);

 @override
  void turnOn() {
   print("Speaker $name is ON");
  }

  @override
  void turnOff() {
    print("Speaker $name is off");
  }

  @override
  void increase() {
    print("volume +5");
  }

  @override
  void decrease() {
    print("volume -5");
  }

  @override
  void showInfo() {
    print("$name, $volume");
  }

}