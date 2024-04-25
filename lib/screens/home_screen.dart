import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_product_screen.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Shop Admin"),
      ),

      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index){
          return const ListTile(
              title: Text('Item'),
              subtitle:  Text('Price:10000'),
          );
      }



      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.to(const AddProductScreen());
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}