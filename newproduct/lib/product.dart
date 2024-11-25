import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newproduct/app_colors.dart';
import 'package:newproduct/app_api.dart';
import 'package:http/http.dart' as http;

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final _keyForm = GlobalKey<FormState>();

  TextEditingController txtProductName = TextEditingController();
  TextEditingController txtDescription = TextEditingController();
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtBarCode = TextEditingController();
  TextEditingController txtExpiredDate = TextEditingController();
  TextEditingController txtQty = TextEditingController();
  TextEditingController txtUnitPriceIn = TextEditingController();
  TextEditingController txtUnitPriceOut = TextEditingController();

  Future<void> addNewProduct(
    String productname,
    String description,
    int category,
    String barcode,
    String expiredDate,
    int qty,
    double unitPriceIn,
    double unitPriceOut,
  ) async {
    EasyLoading.show(status: 'Submitting...');
    var uri = Uri.parse("${AppUrl.url}new_product.php");

    final response = await http.post(uri, body: {
      "product_name": productname,
      "description": description,
      "category": category.toString(),
      "barcode": barcode,
      "expired_date": expiredDate,
      "qty": qty.toString(),
      "unit_pricein": unitPriceIn.toString(),
      "unit_priceout": unitPriceOut.toString(),
    });

    debugPrint("Response status: ${response.statusCode}");
    debugPrint("Response body: ${response.body}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 1) {
        EasyLoading.showSuccess(data['msg_success']);
      } else {
        EasyLoading.showError(data['msg_error']);
      }
    } else {
      EasyLoading.showError("Failed with status code ${response.statusCode}.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add New Product'),
        ),
        body: Form(
            key: _keyForm,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Product name is required!";
                      }
                      return null;
                    },
                    controller: txtProductName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Product name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Description is required!";
                      }
                      return null;
                    },
                    controller: txtDescription,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Category is required!";
                      }
                      return null;
                    },
                    controller: txtCategory,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Category',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Barcode is required!";
                      }
                      return null;
                    },
                    controller: txtBarCode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Barcode',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Expired date is required!";
                      }
                      return null;
                    },
                    controller: txtExpiredDate,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired date',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Qty is required!";
                      }
                      return null;
                    },
                    controller: txtQty,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Qty',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Unit Price in is required!";
                            }
                            return null;
                          },
                          controller: txtUnitPriceIn,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Unit Price in',
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Unit Price out is required!";
                            }
                            return null;
                          },
                          controller: txtUnitPriceOut,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Unit Price out',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 56,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF387F39),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        try {
                          String productname = txtProductName.text.trim();
                          String description = txtDescription.text.trim();
                          int category =
                              int.tryParse(txtCategory.text.trim()) ?? 0;
                          String barcode = txtBarCode.text.trim();
                          String expiredDate = txtExpiredDate.text.trim();
                          int qty = int.tryParse(txtQty.text.trim()) ?? 0;
                          double unitPriceIn =
                              double.tryParse(txtUnitPriceIn.text.trim()) ??
                                  0.0;
                          double unitPriceOut =
                              double.tryParse(txtUnitPriceOut.text.trim()) ??
                                  0.0;

                          addNewProduct(
                            productname,
                            description,
                            category,
                            barcode,
                            expiredDate,
                            qty,
                            unitPriceIn,
                            unitPriceOut,
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Error: ${e.toString()}"),
                          ));
                        }
                      }
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
