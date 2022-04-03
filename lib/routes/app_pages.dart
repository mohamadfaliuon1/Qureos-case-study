import 'package:get/get.dart';
import 'package:qureoscasestudy/modules/auth/views/auth_view.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(name: _Paths.PROFILE, page: () => const AuthView())
    // GetPage(name: _Paths.SIGNIN, page: () => SignInView()),
    // GetPage(name: _Paths.SIGNUP, page: () => SignUpView()),
    // GetPage(name: _Paths.PROFILE, page: () => ProfileView())
  ];
}

abstract class Routes {
  Routes._();

  static const PROFILE = _Paths.PROFILE;
  static const SIGNIN = _Paths.SIGNIN;
  static const SIGNUP = _Paths.SIGNUP;
}

abstract class _Paths {
  static const PROFILE = '/profile';
  static const SIGNIN = '/sign-in';
  static const SIGNUP = '/sign-up';
}
