import 'package:client_footware/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../controller/login_controller.dart';

class Login_Page extends StatelessWidget {
  const Login_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Logincontroller>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/log.jpg"),
                    fit: BoxFit.cover,

                  ),
                ),

              ),
              // SizedBox(
              //   height: 100,
              //   width: double.infinity,
              //   child: Image.asset("assets/log.jpg"),
              // ),


              Text("Welcome Back!",
                style: TextStyle(fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ctrl.Loginnumberctrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    prefixIcon: Icon(Icons.phone_android_rounded),
                    labelText: "Mobile number",
                    hintText: "enter your mobile number"
                ),
              ),
              SizedBox(height: 20,),

              ElevatedButton(onPressed: () {
                ctrl.LoginWithphone();
              },

                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple
                  ),

                  child: Text("Login")),
              SizedBox(height: 20,),

              TextButton(onPressed: () {
                Get.to(Register_Page());
              }, child: Text("Register new account"))

            ],
          ),
        ),
      );
    });
  }
}
