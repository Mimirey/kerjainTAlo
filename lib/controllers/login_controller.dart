import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final  namecontroller= TextEditingController();
  final  passcontroller= TextEditingController();

  final isLoading= false.obs;
}