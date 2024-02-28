import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import '../model/user/user.dart';
import '../pages/home_page.dart';

class Logincontroller extends GetxController{

  GetStorage box = GetStorage();
 FirebaseFirestore firestore = FirebaseFirestore.instance;
 late CollectionReference userCollection;
 TextEditingController Registernamectrl =  TextEditingController();
 TextEditingController Registernumberctrl =  TextEditingController();
 TextEditingController Loginnumberctrl =  TextEditingController();
 OtpFieldControllerV2 otpController = OtpFieldControllerV2();

 bool otpFieldShown = false;
 int ? otpSend;
 int ? otpEnter;
 User ? loginUser;

 @override
  void onReady() {
    Map<String,dynamic>? user = box.read("loginUser");
    if(user!= null){
      loginUser=  User.fromJson(user);
      Get.to(const Home_Page());
    }
    super.onReady();
  }


 @override
  void onInit() {
   userCollection = firestore.collection('users');
    super.onInit();
  }


 addUser(){

   try {

     if(otpSend==otpEnter){

       DocumentReference  _doc = userCollection.doc();

       User user =  User(

           id: _doc.id,
           name: Registernamectrl.text,
           number: int.parse(Registernumberctrl.text)


       );

       final userJson = user.toJson();
       _doc.set(userJson);
       Get.snackbar("Success", "User added successfully ",colorText: Colors.green);
       Registernumberctrl.clear();
       Registernamectrl.clear();
       otpController.clear();

     }else{
       Get.snackbar("Error", "OTP is incorrect ",colorText: Colors.red);
     }





   } catch (e) {
     Get.snackbar("error",e.toString() ,colorText: Colors.red);
     print(e);
   }

 }

 sendOtp(){

   try {

     if(Registernamectrl.text.isEmpty || Registernumberctrl.text.isEmpty){
       Get.snackbar("Error" ,"please fill the fields",colorText: Colors.red);
       return;
     }


     final random = Random();
     int otp = 1000+ random.nextInt(9000);
     print(otp);

     //will send otp and check its successfully or not............

     if(otp != null){
       otpFieldShown = true;
       otpSend = otp;
       Get.snackbar("Success","Otp  send Successfully", colorText: Colors.green);

     }else{
       Get.snackbar("error","Otp not send", colorText: Colors.red);
     }
   } on Exception catch (e) {
     print(e);
   }finally{
     update();
   }
 }
 
 
 Future <void> LoginWithphone()async {
   String phoneNumber = Loginnumberctrl.text;
   if(phoneNumber.isNotEmpty){
     var querySnapshot = await userCollection.where("number",isEqualTo:int.tryParse( phoneNumber)).limit(1).get();
     if(querySnapshot.docs.isNotEmpty){
       var userDoc = querySnapshot.docs.first;
       var userData = userDoc.data() as Map<String,dynamic>;
       box.write("loginUser", userData);
       Loginnumberctrl.clear();
       Get.to(Home_Page());
       Get.snackbar("Success","Login successful",colorText: Colors.green);
     }else{
       Get.snackbar("Error","user not found please register",colorText: Colors.red);
     }

   }else{
     Get.snackbar("Error","Please enter a phonenumber",colorText: Colors.red);
   }
 }

}