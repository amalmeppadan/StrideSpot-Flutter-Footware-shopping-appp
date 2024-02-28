import 'package:client_footware/pages/product_description_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../controller/home_controller.dart';
import '../widget/drop+down_btn.dart';
import '../widget/multi_select_dropdown.dart';
import '../widget/product_card.dart';
import 'login_page.dart';

class Home_Page extends StatelessWidget {

  const Home_Page({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchProduct();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Footware store", style: TextStyle(fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(Login_Page());
              }, icon: Icon(Icons.logout))
            ],
          ),

          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ctrl.productCatagory.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              ctrl.filterByCategory(ctrl.productCatagory[index].name ?? "");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Chip(label: Text(ctrl.productCatagory[index].name ?? "error")),
                            ),
                          );
                        }),
                  ),
                  //  SizedBox(height: 10,),

                  Row(
                    children: [
                      Drop_down_Btn(items: ["Rs : Low to High", "Rs:High to Low"],
                        SelectedItemsText: "Sort",
                        onSelected: (selected) {
                        ctrl.sortByPrice(ascending: selected == "Rs : Low to High" ? true : false);
                        },),
                      SizedBox(
                          height: 50,
                          width: 170,

                          child: Multiselect_Dropdown(
                            items: ["Boots", "Dress shoe", "Kitten Heel","Sandals","Shoes"],
                            onSelectionChanged: (selectedItems) {
                              ctrl.filterByBrand(selectedItems);
                            },))
                    ],
                  ),

                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: GridView.builder(
                        itemCount:ctrl.products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.8,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8
                        ),

                        itemBuilder: (context, index) {
                          return Productcard(
                              name: ctrl.productShowInUi[index].name ?? "no name",
                              imageUrl: ctrl.productShowInUi[index].image ?? "url",
                              price: ctrl.productShowInUi[index].price ?? 00,
                              offerTag: '30% off',
                              onTap: () {
                              Get.to(Product_description(),arguments: {"data":ctrl.productShowInUi[index] });
                              });
                        }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
