import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:footware_admin/model/product/product.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  FirebaseFirestore  _firestore =  FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController ProductnameCtrl = TextEditingController();
  TextEditingController PrductDescriptionctrl = TextEditingController();
  TextEditingController ProductImgCtrl = TextEditingController();
  TextEditingController ProductPriceCtrl = TextEditingController();

  String category = "general";
  String brand ="un branded";
  bool offer = false;

  List<Product> products = [];


  @override
  void onInit() async{
    productCollection = _firestore.collection("products");
   await fetchProduct();
    super.onInit();
  }

 addProducts(){

    try {
      DocumentReference  _doc = productCollection.doc();

      Product product = Product(

            id: _doc.id,
            name: ProductnameCtrl.text,
            category: category,
            description: PrductDescriptionctrl.text,
            price: double.tryParse(ProductPriceCtrl.text),
            brand: brand,
            image: ProductImgCtrl.text,
            offer:offer
          );
      final productJson = product.toJson();
      _doc.set(productJson);
      Get.snackbar("Success", "Product added successfully ",colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar("error",e.toString() ,colorText: Colors.red);
      print(e);
    }

 }


 fetchProduct() async {
   try {
     QuerySnapshot productSnapshot=   await productCollection.get();

     final List<Product> retrievedProduct = productSnapshot.docs.map((doc) =>
            Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
     products.clear();
     products.assignAll(retrievedProduct);
     Get.snackbar("Success", "product fetch successfully",colorText: Colors.green);

   } catch (e) {
     Get.snackbar("Error",e.toString(),colorText: Colors.red);
     print(e);
   }finally{
     update();
   }

 }


 deleteProduct(String id)async{
   try {
     await productCollection.doc(id).delete();
     fetchProduct();
   } catch (e) {
     Get.snackbar("Error",e.toString(),colorText: Colors.red);
     print(e);
   }
 }


 setValuesDefault(){
    ProductnameCtrl.clear();
    ProductPriceCtrl.clear();
    PrductDescriptionctrl.clear();
    ProductImgCtrl.clear();

    category = "general";
    brand ="un branded";
    offer = false;
    update();

 }


}