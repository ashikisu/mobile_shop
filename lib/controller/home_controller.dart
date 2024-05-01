import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/model/product/product.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  late CollectionReference productiveCollection;

  TextEditingController productNameController= TextEditingController();
  TextEditingController productDescriptionController= TextEditingController();
  TextEditingController productImageUrlController= TextEditingController();
  TextEditingController productPriceController= TextEditingController();

  String category='Select Category';
  String brand='Select Brand';
  bool offer=false;

  List<Product> products=[];

  @override
  Future<void> onInit() async {

    productiveCollection= firestore.collection('Mobile Phone');
    await fetchProducts();



    super.onInit();
  }

  addProduct(){
    try {
      DocumentReference doc= productiveCollection.doc();
      Product product =Product(
        id:doc.id,
        name:productNameController.text,
        category: category,
        description: productDescriptionController.text,
        price: double.tryParse(productPriceController.text),
        brand: brand,
        image: productImageUrlController.text,
        offer: false,
      );
      final productJson=product.toJson();
      doc.set(productJson);
      Get.snackbar('Success', 'Product Added Successfully', colorText:Colors.purple);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error',e.toString(), colorText:Colors.purple);
      print(e);
    }


  }

  fetchProducts() async {

    try {
      QuerySnapshot productSnapshot=await productiveCollection.get();
      final List<Product> retrievedProduct= productSnapshot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProduct);
      Get.snackbar('Success', 'Fetched Successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.red);
      print(e);
    }finally{
      update();
    }
  }
  deleteProduc(String id) async {
    try {
      await productiveCollection.doc(id).delete();
      fetchProducts();

    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText:Colors.red);

      print(e);
    }
  }

  setValuesDefault(){
    productNameController.clear();
    productDescriptionController.clear();
    productImageUrlController.clear();
    productPriceController.clear();
    category='Select Category';
    brand= 'Select Brand';
    offer= false;

    update();


  }


}