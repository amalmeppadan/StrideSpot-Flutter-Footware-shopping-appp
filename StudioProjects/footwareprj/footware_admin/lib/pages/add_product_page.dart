import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/controller/home_controller.dart';
import 'package:footware_admin/widgets/drop+down_btn.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Add_product extends StatelessWidget {
  const Add_product({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Add product"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add New Product", style: TextStyle(fontSize: 30,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.ProductnameCtrl,
                  decoration: InputDecoration(
                      label: Text("Product name"),
                      hintText: "enter your product name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.PrductDescriptionctrl,
                  decoration: InputDecoration(
                      label: Text("Product description"),
                      hintText: "enter your product description",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: ctrl.ProductImgCtrl,
                  decoration: InputDecoration(
                      label: Text("Image Url"),
                      hintText: "enter your Image Url",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller:ctrl.ProductPriceCtrl ,
                  decoration: InputDecoration(
                      label: Text("Product price"),
                      hintText: "enter your product price",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                ),
                SizedBox(height: 10,),
                Row(

                  children: [
                    Flexible(child: Drop_down_Btn(
                      items: ["Boots", "Shoe", "Beach shoes","High heals"],
                      SelectedItemsText: ctrl.category,
                      onSelected: (SelectedValue) {
                        ctrl.category=SelectedValue ?? "general";
                        ctrl.update();


                      },)),
                    Flexible(child: Drop_down_Btn(
                      items: ["Puma","Sketchers","Adidas","Clarks"],
                      SelectedItemsText: ctrl.brand,
                      onSelected: (SelectedValue) {
                        ctrl.brand = SelectedValue ?? "un branded";
                        ctrl.update();


                      },)),
                  ],
                ),
                SizedBox(height: 10,),

                Text("offer product?", style: TextStyle(fontSize: 15),),
                Drop_down_Btn(items: ["true", "false"],
                  SelectedItemsText: ctrl.offer.toString(),
                  onSelected: (SelectedValue) {
                  ctrl.offer = bool.tryParse(SelectedValue ?? "false") ?? false;
                  ctrl.update();

                  },),

                SizedBox(height: 10,),

                ElevatedButton(onPressed: () {
                  ctrl.addProducts();

                },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigoAccent,
                        foregroundColor: Colors.white
                    ),

                    child: Text("Add Product"))


              ],
            ),
          ),
        ),
      );
    });
  }
}
