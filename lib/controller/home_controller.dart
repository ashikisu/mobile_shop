import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  FirebaseFirestore firestore= FirebaseFirestore.instance;
  late CollectionReference productiveCollection;

  @override
  void onInit() {

    productiveCollection= firestore.collection('Mobile Phone');



    super.onInit();
  }

  addProduct(){
    DocumentReference doc= productiveCollection.doc();
  }

}