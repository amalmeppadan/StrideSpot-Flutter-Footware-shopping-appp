import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../model/user/user.dart';
import '../pages/home_page.dart';
import 'login_controller.dart';

class PurchaseController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;


  TextEditingController adressCtrl = TextEditingController();

  double orderPrice = 0;
  String itemName = "";
  String orderAddress = "";

  @override
  void onInit() async{
    orderCollection = firestore.collection("order");
    super.onInit();
  }


  submitOrder({
    required double price,
    required String item,
    required description}){

    orderPrice = price;
    itemName = item;
    orderAddress = adressCtrl.text;

    Razorpay _razorpay =Razorpay();

    var options = {
      'key': 'rzp_test_oiF7AXLTipZqr9',
      'amount': price * 100,
      'name': item,
      'description': description,
    };


    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.open(options);



}

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    orderSuccess(transactionid: response.paymentId);
    Get.snackbar("Success","Payment is sucessfull", colorText: Colors.green);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar("Error","${response.message}", colorText: Colors.red);
  }

  Future<void>orderSuccess({required String ? transactionid})async {

    User? loginUse = Get.find<Logincontroller>().loginUser;
    try{
      if(transactionid != null){
        DocumentReference docRef = await orderCollection.add({
          "customer":loginUse?.name ?? "",
          "phone": loginUse?.number ?? "",
          "item" : itemName,
          "price": orderPrice,
          "address": orderAddress,
          "transactionid": transactionid,
          "dateTime": DateTime.now().toString(),
        });
        print("order created Successfully: ${docRef.id}");
        showOrderSuccessDialog(docRef.id);
        Get.snackbar("Success","order created successfully", colorText: Colors.green);
      }else{
        Get.snackbar("Error","Please fill all fields", colorText: Colors.red);
      }
    }catch(e){
      print("error ${e}");
    }

  }
    void showOrderSuccessDialog(String orderId){
    Get.defaultDialog(
      title: "Order Success",
      content: Text("your OrderId is $orderId"),
      confirm: ElevatedButton(onPressed: () {
        Get.off(Home_Page());
      }, child: Text("Close"))
    );
    }
}