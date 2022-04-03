import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qureoscasestudy/modules/auth/controllers/auth_controller.dart';
import 'package:validators/validators.dart' as validator;

import '../../../widgets/button.dart';
import '../../../widgets/text_button.dart';
import '../../../widgets/text_field.dart';

class AuthBody extends StatefulWidget {
  final AuthController authController;
  const AuthBody(this.authController, {Key? key}) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  Map<String, String> body = {
    'email': '',
    'password': '',
  };

  void signINSignUp() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();
    if (widget.authController.authMode == AuthMode.signIn) {
      widget.authController.login(body['email']!, body['password']!);
    } else {
      widget.authController.signUp(body['email']!, body['password']!);
    }
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.authController.authMode == AuthMode.signIn
              ? 'Sign in'
              : 'Sign up',
          style: const TextStyle(
              color: Color(0xff00ADB5),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: size.height * 0.03,
        ),
        Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextFormField(
                    label: 'email',
                    hintText: 'please enter your email',
                    validator: (String email) {
                      if (!validator.isEmail(email)) {
                        return 'please enter a valide email';
                      }
                      if (email.isEmpty) {
                        return 'please enter email';
                      }
                    },
                    onSaved: (String email) {
                      body['email'] = email;
                    },
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: size.height * 0.01,
                ),
                MyTextFormField(
                    label: 'password',
                    controller: _passwordController,
                    hintText: 'please enter your password',
                    validator: (String password) {
                      if (password.isEmpty) {
                        return 'please enter password';
                      }
                      if (password.length < 6) {
                        return 'password should be 7 at least';
                      }
                    },
                    onSaved: (String passowrd) {
                      body['password'] = passowrd;
                    },
                    isPassword: true,
                    showPassword: true,
                    textInputType: TextInputType.visiblePassword),
                if (widget.authController.authMode == AuthMode.signUp)
                  FadeTransition(
                    opacity: _opacityAnimation,
                    child: MyTextFormField(
                        label: 'confirm password',
                        hintText: 'please renter your password',
                        validator: (String password) {
                          if (password.isEmpty) {
                            return 'please enter confirm password';
                          }
                          if (password != _passwordController.text) {
                            return 'passwords do not match!';
                          }
                        },
                        onSaved: (String passowrd) {},
                        isPassword: true,
                        showPassword: true,
                        textInputType: TextInputType.visiblePassword),
                  ),
              ],
            )),
        SizedBox(
          height: size.height * 0.03,
        ),
        if (widget.authController.authMode == AuthMode.signIn)
          Center(
              child: RichTextButton(
            text1: 'don\'t you have account?',
            text2: 'sign up',
            onClick: () {
              _controller.forward();
              setState(() {
                widget.authController.authMode = AuthMode.signUp;
              });
              // widget.authController.changeMode(AuthMode.signUp);
            },
          )),
        if (widget.authController.authMode == AuthMode.signUp)
          Center(
              child: RichTextButton(
            text1: 'do you have account?',
            text2: 'sign in',
            onClick: () {
              _controller.reverse();
              setState(() {
                widget.authController.authMode = AuthMode.signIn;
              });
            },
          )),
        SizedBox(
          height: size.height * 0.01,
        ),
        Center(
            child: Obx(
          () => CaseStudyButton(
              text: widget.authController.authMode == AuthMode.signIn
                  ? 'Sign in'
                  : 'Sign up',
              isLoading: widget.authController.authMode == AuthMode.signIn
                  ? widget.authController.isLoggingIn.value
                  : widget.authController.isRegistering.value,
              onClick: () {
                signINSignUp();
              }),
        )),
        SizedBox(
          height: size.height * 0.03,
        ),
        Center(child: GoogleSignINButton(onPressed: () async {
          await widget.authController.googleSignIN();
        }))
      ],
    );
  }
}
