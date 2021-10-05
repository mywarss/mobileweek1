import 'week3_city.dart';
import 'week3_country.dart';

void main() {
  City item = new City("Thailand", "Thai", "Bangkok");
  print("ประเภท : " + item.name);
  print("ภาษาไทย : " + item.showLanguage());
  Country.animal = "ช้าง";
  print("สัตว์ประจำชาติ : " + Country.animal);
  Country.showProvince(77);

  item.showStraigh();
  item.showStory();
  item.showProblem();
  item.showPeople();
}
