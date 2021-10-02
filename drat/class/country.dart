class Country {
  var country = "Japen";
  var city;
  var _animal = "Nako";
  static var color = "Blue";

  Country(this.city, this._animal);

  Country.thai(String city, String animal) : this(city, animal);

  void callHello() {
    print("สวัสดีครับ");
  }

  String callAnimal() {
    return this._animal;
  }
}
