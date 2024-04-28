import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_shop/controller/home_controller.dart';
import 'add_product_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (control) {
      return Scaffold (
      appBar: AppBar(
        title: const Text("Mobile Shop Admin"),
        centerTitle: true,
      ),

      body: ListView.builder(
          itemCount: control.products.length,
          itemBuilder: (context, index) {
            return  ListTile(
              title: Text(control.products[index].name?? ''),
              subtitle: Text((control.products[index].price ?? 0).toString()),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: (){
                  control.deleteProduc(control.products[index].id ?? '');

                },
              )
            );
          }


      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          Get.to(const AddProductScreen());
        },
        child: const Icon(Icons.add),


      ),

      );
    });
  }
}