import 'switchable.dart';

abstract class Device implements Switchable {
  final String name;
  Device(this.name);
  void showInfo() {
    print('device: $name');
  }
}
