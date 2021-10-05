import 'week3_country.dart';
import 'week3_problem.dart';

class City extends Country with Problem {
  var city;
  City(String name, String language, this.city) : super(name, language);

  void showStraigh() {
    print(super.name + " คนส่วนใหญ่มีน้ำใจ");
    print(this.city + "โดยสถานการณ์ปกติเป็นเมืองที่น่าท่องเที่ยว");
  }

  void showStory() {
    print("คนไทยไม่ได้ขี่" + Country.animal + "ในการเดินทาง");
  }

  @override
  void showPeople() {
    print(this.city + 'มีประชากรอาศัยประมาณ 5 ล้านคน');
  }
}
