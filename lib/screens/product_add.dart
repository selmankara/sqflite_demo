import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import 'package:sqflite_demo/models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Ürün Ekle'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            buildNameField(),
            buildDescriptionFiled(),
            buildUnitPriceField(),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ürün Adı'),
      controller: txtName,
    );
  }

  buildDescriptionFiled() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ürün Açıklaması'),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Birim Fiyatı'),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return FlatButton(
      child: Text('Ekle'),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    var result = await dbHelper.insert(Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.tryParse(txtUnitPrice.text)));
    Navigator.pop(context, true);
  }
}
