class Country {
  var name;
  var _language;
  static var animal = "ช้าง";

  Country(this.name, this._language);

  String showLanguage() => this._language;

  static showProvince(int province) {
    print("ประเทศมีจำนวนทั้งหมด $province จังหวัด");
  }

  void showPeople() {
    print('มีประชากรอาศัยประมาณ 70 ล้านคน');
  }
}
