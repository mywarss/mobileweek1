import 'package:flutter/material.dart';
import 'package:mobileappweek1/config/constant.dart';
import 'package:firebase_database/firebase_database.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  // ประกาศตัวแปรสำหรับการเพิ่มสินค้า
  String? name, price, status;
  final formKey = GlobalKey<FormState>();

  // กำหนดค่าเริ่มต้นสำหรับการส่งข้อมูลไปที่ Realtime Firebase
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  Future<void> createData() async {
    dbfirebase.push().set({
      'product': name,
      'price': price,
      'status': status,
    }).then((value) {
      print("Success");
    }).catchError((onError) {
      print(onError.code);
      print(onError.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtPrice(),
                txtStatus(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Product:',
          icon: Icon(Icons.production_quantity_limits),
          hintText: 'Input your product name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value;
        },
      ),
    );
  }

  Widget txtPrice() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'ราคา:',
          icon: Icon(Icons.price_check),
          hintText: 'ใส่ราคาสินค้า',
        ),
        validator: (value) {},
        onSaved: (value) {
          price = value;
        },
      ),
    );
  }

  Widget txtStatus() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'คำอธิบาย:',
          icon: Icon(Icons.description),
          hintText: 'ใส่คำบรรบายสินค้า',
        ),
        onSaved: (value) {
          status = value;
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            print(price);
            print(status);
            createData();
          }
        },
        child: Text('Save'),
      );
}
