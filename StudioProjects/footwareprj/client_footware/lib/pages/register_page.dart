import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../widget/otp_txt_fld.dart';
import 'login_page.dart';

class Register_Page extends StatelessWidget {
  const Register_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Create your Account !!",
                style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),),

              SizedBox(
                height: 20,
              ),

              TextField(
                controller:ctrl.Registernamectrl ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.person),
                    labelText: "your name",
                    hintText: "enter your name"
                ),
              ),

              SizedBox(height: 20,),

              TextField(
                controller:ctrl.Registernumberctrl ,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android),
                    labelText: "Mobile number",
                    hintText: "enter your Mobile number"
                ),
              ),

              SizedBox(height: 20,),

              otptextField(otpController: ctrl.otpController, visible: ctrl.otpFieldShown,
                onComplete: (otp ) {
                ctrl.otpEnter = int.tryParse(otp ?? "0000");

              },),

              SizedBox(height: 20,),

              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(onPressed: () {

                  if(ctrl.otpFieldShown){
                    ctrl.addUser();
                    Get.to(Login_Page());
                  }else{
                    ctrl.sendOtp();
                  }

                },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                    ),

                    child: Text(ctrl.otpFieldShown ? "Register":"send OTP")),
              ),

              SizedBox(height: 20,),

              TextButton(onPressed: () {

                Get.to(Login_Page());
              }, child: Text("Login"))
            ],
          ),
        ),
      );
    });
  }
}
