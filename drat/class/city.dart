import 'country.dart';
import 'problem.dart';

class City extends Country with Problems {
  City() : super("Tokyo", "Nako");

  void callSuper() {
    print("เมืองหลวง :" + super.city);
    super.callHello();
  }

  @override
  String callAnimal() {
    return "Nako";
  }
}
