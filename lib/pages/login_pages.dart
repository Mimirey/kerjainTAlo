import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:projectquranmu_application/components/custom_button.dart';
import 'package:projectquranmu_application/components/custom_textfield.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD1DCDC),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0xff58A0A0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
              ),
              Positioned(
                top: 220, 
                left: 20,
                right: 20,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff3C7676)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: CustomTextField(
                          hint: "Username", 
                          radius: BorderRadius.circular(15),
                          icon: Icons.email_outlined),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: CustomTextField(
                          hint: "Password", 
                          radius: BorderRadius.circular(15),
                          icon: Icons.password,
                          isPassword: true,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: CustomButton(
                          text: "Login", 
                          width: double.infinity, 
                          radius: 15, 
                          backgroundColor: Color(0xff3C7676),
                          textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                          onTap: (){
                            Get.offAllNamed(AppRoutes.attachmentPage);
                          },
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}