void main() {
  //print(callGen(1999));
/*
  var x = callColor("while");
  print(x);
  */
  callweb("google", port: 443);
}

String callGen(int year) => (year >= 1996) ? ("Gen Z") : ("Gen Y");

int callColor([String newColor = "pink"]) {
  List<dynamic> color = ["red, blue, green"];
  for (var item in color) {
    print(item);
  }
  return color.length;
}

void callweb(String web, {int port = 80}) => print("$web : $port");
