import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:qureoscasestudy/modules/auth/controllers/auth_controller.dart';
import 'package:qureoscasestudy/modules/auth/views/auth_body.dart';
import 'package:qureoscasestudy/modules/auth/views/profile_body.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Obx(
        () {
          return Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.15,
                right: size.width * 0.15),
            child: controller.userEmail.value == null
                ? AuthBody(controller)
                : ProfileBody(
                    email: controller.userEmail.value!,
                    isLoading: controller.isLoggingOut.value,
                    logOut: controller.logOut),
          );
        },
      )),
    );
  }
}
