import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qureoscasestudy/providers/api_provider.dart';

import 'modules/auth/bindings/auth_binding.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(ApiRequests());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.PROFILE,
      getPages: AppPages.routes,
      initialBinding: AuthBinding(),
    ),
  );
}
