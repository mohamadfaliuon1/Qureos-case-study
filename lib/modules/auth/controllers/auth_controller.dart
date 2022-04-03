import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../providers/api_provider.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/notifier.dart';

enum AuthMode { signUp, signIn }

class AuthController extends GetxController {
  Rx<String?> userEmail = Rx(null);
  AuthMode authMode = AuthMode.signIn;

  RxBool isRegistering = false.obs;
  RxBool isLoggingIn = false.obs;
  RxBool isLoading = false.obs;
  RxBool isLoggingOut = false.obs;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login(String email, String password) async {
    try {
      isLoggingIn(true);
      var x = await Get.find<ApiRequests>().login(email, password);
      print(x.email);
      print(x.registered);
      // print(x.error['message']);
      userEmail.value = x.email;
      if (x.error != null) {
        Notifier.showSnackBar('${x.error['message']}', error: true);
        isLoggingIn(false);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      isRegistering(true);
      var x = await Get.find<ApiRequests>().signUp(email, password);
      userEmail.value = x.email;
      if (x.error != null) {
        Notifier.showSnackBar('${x.error['message']}', error: true);
        isRegistering(false);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> logOut() async {
    isLoggingOut(true);
    await Future.delayed(const Duration(milliseconds: 100));
    isLoggingOut(false);
    isRegistering(false);
    isLoggingIn(false);
    userEmail(null);
    userEmail.value = null;
    _googleSignIn.signOut();
    _auth.currentUser!.delete();
    // Get.offAndToNamed(Routes.SIGNIN);
  }

  Future<void> googleSignIN() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final authResult = await _auth.signInWithCredential(credential);
    final _user = authResult.user;
    userEmail.value = _user!.email;
  }
}
