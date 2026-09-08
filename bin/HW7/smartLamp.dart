import 'adjustable.dart';
import 'batteryPowered.dart';
import 'device.dart';

class smartlamp extends Device with BatteryPowered implements Adjustable {
  int brightness;

  smartlamp(super.name, this.brightness);

 @override
  void turnOn() {
   print("lamp $name is on");
  }

  @override
  void turnOff() {
    print("lamp $name is off");
  }

  @override
  void increase() {
    print("яркость +10");
  }

  @override
  void decrease() {
    print("яркость -10");
  }

  @override
  void showInfo() {
    print("$name, $brightness");
  }

}
