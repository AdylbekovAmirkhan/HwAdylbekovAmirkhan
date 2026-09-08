import 'device.dart';

class smartThermostat extends Device {
  int temperature;

  smartThermostat(super.name, this.temperature);

 @override
  void turnOn() {
   print("thermostat $name is on");
  }

  @override
  void turnOff() {
    print("thermostat $name is off");
  }

  @override
  void showInfo() {
    print("$name, $temperature");
  }

}