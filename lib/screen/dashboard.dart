import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobileappweek1/config/constant.dart';
import 'package:mobileappweek1/model/tct.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('hello');
    callAPI();
  }

  Future<void> callAPI() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    var response = await http.get(url);

    setState(() {
      data = tctFromJson(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(211, 211, 211, 100)),
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 28,
                  color: pColor,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'Video');
              },
              title: Text(
                'Video',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(
                Icons.video_call,
                color: Colors.grey,
                size: 36,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'Image');
              },
              title: Text(
                'Image',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(
                Icons.image,
                color: Colors.grey,
                size: 30,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, 'Location');
              },
              title: Text(
                'Location',
                style: TextStyle(fontSize: 18),
              ),
              leading: Icon(
                Icons.gps_fixed_rounded,
                color: Colors.grey,
                size: 30,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.api),
            SizedBox(width: 10),
            Text('Dashboard'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(data?.activity ?? "Loading.."),
            Text(data?.type ?? ""),
            Text('${data?.price ?? ''}'),
            Text('${data?.participants ?? ''}'),
          ],
        ),
      ),
    );
  }
}
