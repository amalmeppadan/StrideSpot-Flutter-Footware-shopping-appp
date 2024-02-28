import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import 'add_product_page.dart';


class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Footware Admin"),
          centerTitle: true,

        ),

        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (BuildContext context, int index) =>
                ListTile(
                  title: Text(ctrl.products[index].name ?? ""),
                  subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                  trailing: IconButton(
                      onPressed: () {
                        ctrl.deleteProduct(ctrl.products[index].id ?? "");
                        
                      }, icon: Icon(Icons.delete, size: 25,)),
                )


        ),

        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.to(Add_product());
        }, child: Icon(Icons.add),),

      );
    });
  }
}

