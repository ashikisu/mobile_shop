import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:mobile_shop/controller/home_controller.dart';
import 'package:mobile_shop/widget/drop_down_button.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (control) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              children: [
                const Text("Add Product",
                  style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold,
                    color: Colors.purple,

                  ),
                ),

                const SizedBox(height: 15,),

                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      label: const Text('Product Name'),
                      hintText: 'Enter Your Product Name'
                  ),
                ),
                const SizedBox(height: 15,),

                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),

                    ),
                    label: const Text('Product Details'),
                    hintText: 'Enter Your Product Details',
                    helperMaxLines: 10,
                  ),
                  maxLines: 6,
                ),
                const SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      label: const Text('Image URL'),
                      hintText: 'Enter Image URL'
                  ),
                ),
                const SizedBox(height: 15,),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),

                      ),
                      label: const Text('Price'),
                      hintText: 'Enter Your Product Price'
                  ),
                ),

                Row(
                  children: [
                    Flexible(child: DropDownBtn(
                      items: const ['Cat1', 'Cat Brand 1'],
                      selectedItemText: 'Category',
                      onSelected: (selectedValue) {},
                    )),
                    Flexible(child: DropDownBtn(
                      items: const ['Cat2', 'Brand 2'],
                      selectedItemText: 'Brand',
                      onSelected: (selectedValue) {},
                    )),
                  ],
                ),
                const Text("Offer Product ? "),

                DropDownBtn(items: const ['true', 'false'],
                  selectedItemText: 'Offer ? ',
                  onSelected: (selectedValue) {},),
                ElevatedButton(onPressed: () {},
                    child: const Text(
                      "Add Product", style: TextStyle(color: Colors.purple),))
              ],

            ),

          ),
        ),

      );
    });
  }
}
