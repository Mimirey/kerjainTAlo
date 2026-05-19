import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projectquranmu_application/bindings/app_binding.dart';
import 'package:projectquranmu_application/configs/pages.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialBinding: AppBinding(),
      initialRoute: AppRoutes.loginPage,
      getPages: AppPages.pages,
    );
  }
}

