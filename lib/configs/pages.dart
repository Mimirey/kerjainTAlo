import 'package:get/get.dart';
import 'package:projectquranmu_application/bindings/app_binding.dart';
import 'package:projectquranmu_application/bindings/teacher%20site/bukuprestasi_binding.dart';
import 'package:projectquranmu_application/bindings/teacher%20site/inputharian_binding.dart';
import 'package:projectquranmu_application/bindings/teacher%20site/inputjilid_binding.dart';
import 'package:projectquranmu_application/bindings/teacher%20site/teacherreport_binding.dart';
import 'package:projectquranmu_application/bindings/login_binding.dart';
import 'package:projectquranmu_application/configs/routes.dart';
import 'package:projectquranmu_application/pages/attachment.dart';
import 'package:projectquranmu_application/pages/ortu%20site/homeortu_page.dart';
import 'package:projectquranmu_application/pages/ortuattachment.dart';
import 'package:projectquranmu_application/pages/teacher%20site/bukuprestasi_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/inputharian_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/inputjilid_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/reportteacher_page.dart';
import 'package:projectquranmu_application/pages/teacher%20site/hometeacher_page.dart';
import 'package:projectquranmu_application/pages/login_pages.dart';

class AppPages{
  static final pages=[
    GetPage(
      name: AppRoutes.loginPage, 
      page: ()=>LoginPage(),
      binding: LoginBinding()
      ),
      GetPage(
      name: AppRoutes.hometeacherPage, 
      page: ()=>HometeacherPage(),
      binding: AppBinding()
      ),
      GetPage(
      name: AppRoutes.attachmentPage, 
      page: ()=>Attachment(),
      binding: AppBinding()
      ),
      GetPage(
      name: AppRoutes.teacherreportPage, 
      page: ()=>TeacherReportPage(),
      binding: TeacherReportBinding()
      ),
      GetPage(
      name: AppRoutes.bukuprestasiPage, 
      page: ()=>BukuprestasiPage(),
      binding: BukuprestasiBinding()
      ),
      GetPage(
      name: AppRoutes.inputharianPage, 
      page: ()=>InputharianPage(),
      binding: InputharianBinding()
      ),
      GetPage(
      name: AppRoutes.inputjilidPage, 
      page: ()=>InputjilidPage(),
      binding: InputjilidBinding()
      ),

      GetPage(
      name: AppRoutes.homeortuPage, 
      page: ()=>HomeortuPage(),
      binding: InputjilidBinding()
      ),
      GetPage(
      name: AppRoutes.ortuattachmentPage, 
      page: ()=>Ortuattachment(),
      binding: AppBinding()
      ),
    
  ];
}