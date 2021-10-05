void main() {
  var resultGen = callGeneration(2000);
  print("คุณเกิดอยู่ในยุค $resultGen");

  var resultCount = callColor("white");
  print("จำนวน List ทั้งหมดเท่ากับ $resultCount");

  var resultInfo = callInfoweb("facebook");
  // var resultInfo = callInfoweb("facebook", protocal: "https", port: 8080);
  print(resultInfo);
}

String callGeneration(int year) {
  var x = (year <= 1996) ? "GenY or Upper" : "GenZ";
  return x;
}

int callColor([String newColor = "black"]) {
  List<String> color = ["red", "green", "blue"];
  color.add(newColor);

  for (var item in color) {
    print(item);
  }

  return color.length;
}

String callInfoweb(String webName, {int port: 80, String protocal: "http"}) =>
    ("$webName $protocal $port");
