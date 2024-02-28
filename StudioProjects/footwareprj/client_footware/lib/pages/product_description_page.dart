import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controller/purchase_controller.dart';
import '../model/product/product.dart';

class Product_description extends StatelessWidget {
  const Product_description({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments["data"];
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Product Details", style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRect(

                child: Image.network(product.image ?? "",
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              SizedBox(height: 20,),

              Text(product.name ?? "",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text(product.description ?? "",
                style: TextStyle(fontSize: 16, height: 1.5),),
              SizedBox(height: 20,),
              Text("Rs : ${product.price ?? ""}", style: TextStyle(fontSize: 20,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextField(
                controller: ctrl.adressCtrl,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  labelText: "enter your billing address",
                ),
              ),
              SizedBox(height: 20,),

              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {
                    ctrl.submitOrder(price: product.price ?? 00, item: product.name ?? "", description: product.description ?? "");
                  },
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white
                      ),

                      child: Text("Buy Now")))


            ],
          ),
        ),
      );
    });
  }
}
