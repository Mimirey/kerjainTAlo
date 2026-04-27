import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Ini profile hehe"),
    );
  }
}