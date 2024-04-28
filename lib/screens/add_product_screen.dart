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
                  controller: control.productNameController,
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
                  controller: control.productDescriptionController,
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
                  controller: control.productImageUrlController,
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
                  controller: control.productPriceController,
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
                      items: const ['Smart Phone', 'Tablet'],
                      selectedItemText: control.category,
                      onSelected: (selectedValue) {
                        control.category=selectedValue?? 'Unknown';
                        control.update();
                      },
                    )),
                    Flexible(child: DropDownBtn(
                      items: const ['Apple ', 'Vivo','Oppo',' Xiaomi','Techno', 'Realme'],
                      selectedItemText: control.brand,
                      onSelected: (selectedValue) {
                        control.brand=selectedValue?? 'UnKnown';
                        control.update();
                      },
                    )),
                  ],
                ),
                const Text("Offer Product ? "),

                DropDownBtn(items: const ['true', 'false'],
                  selectedItemText: control.offer.toString(),
                  onSelected: (selectedValue) {

                  control.offer= bool.tryParse(selectedValue ?? 'false')?? false;
                  control.update();
                  },),
                ElevatedButton(onPressed: () {
                  control.addProduct();
                },
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
