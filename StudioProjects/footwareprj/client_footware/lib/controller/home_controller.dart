


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';
import '../model/product_catagory/product_catagory.dart';

class HomeController extends GetxController{

  FirebaseFirestore  _firestore =  FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference catagoryCollection;

  List<Product> products = [];
  List<Product> productShowInUi = [];
  List<ProductCatagory> productCatagory = [];


  @override
  void onInit() async{
    productCollection = _firestore.collection("products");
    catagoryCollection = _firestore.collection("category");
    await fetchCatagory();
    await fetchProduct();
    super.onInit();
  }


  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot=   await productCollection.get();

      final List<Product> retrievedProduct = productSnapshot.docs.map((doc) =>
          Product.fromJson(doc.data() as Map<String,dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProduct);
      productShowInUi.assignAll( products);
      Get.snackbar("Success", "product fetch successfully",colorText: Colors.green);

    } catch (e) {
      Get.snackbar("Error",e.toString(),colorText: Colors.red);
      print(e);
    }finally{
      update();
    }

  }

  fetchCatagory() async {
    try {
      QuerySnapshot catagorySnapshot=   await catagoryCollection.get();

      final List<ProductCatagory> retrievedCatagories = catagorySnapshot.docs.map((doc) =>
          ProductCatagory.fromJson(doc.data() as Map<String,dynamic>)).toList();
      productCatagory.clear();
      productCatagory.assignAll(retrievedCatagories);


    } catch (e) {
      Get.snackbar("Error",e.toString(),colorText: Colors.red);
      print(e);
    }finally{
      update();
    }

  }

  filterByCategory(String category){
    productShowInUi.clear();
    productShowInUi = products.where((product) => product.category == category).toList();
    update();
  }

  filterByBrand(List<String> brands) {

    if(brands.isEmpty){
      productShowInUi = products;
    }else{
      List<String> lowerCaseBrands = brands.map((brand) => brand.toLowerCase()).toList();
      productShowInUi = products.where((product) => lowerCaseBrands.contains(product.brand ?? "")).toList();
    }
    update();



  }

  sortByPrice({required bool ascending}){

    List<Product> sortedProducts = List<Product>.from(productShowInUi);
    sortedProducts.sort((a,b) => ascending ? a.price!.compareTo(b.price!): b.price!.compareTo(a.price!));
    productShowInUi = sortedProducts;
    update();

  }

}