import 'city.dart';

void main() {
  print("Hello World");
  // Country item = new Country.thai("กรุงเทพ", "ช้าง");
  // print("Welcome to " + item.country);
  // item.callHello();
  // print("เมืองหลวง :" + item.city);
  // print("สัตว์ประจำชาติ :" + item.callAnimal());
  // print("สีประจำชาติ :" + Country.color);
// ddd
  var order = City();
  print("Welcome to " + order.country);
  order.callSuper();

  print(order.callAnimal());
  order.callProblem();
}
