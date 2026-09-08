import 'device.dart';
import 'smartLamp.dart';
import 'smartSpeaker.dart';
import 'smartThermostat.dart';
import 'adjustable.dart';
import 'batteryPowered.dart';

void main(){
  List<Device> hw = [smartlamp("name", 20),
   smartspeaker("bigspeaker", 100),
    smartThermostat("mythermostat", 44)];
  for (var i in hw){
    i.showInfo();
    i.turnOn();
  }
}