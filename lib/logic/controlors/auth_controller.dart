import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:frist_app/routes/route.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isCheckBox = false;
  var displayUserName = '';
  var displayUserPhoto = '';
  var googeSignIn = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

  var isSignedId = false;
  final GetStorage authBox = GetStorage();

  void visibility() {
    isVisibility = !isVisibility;

    update();
  }

  void checkBox() {
    isCheckBox = !isCheckBox;

    update();
  }

  void signUpUsingFirebase({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';

      if (error.code == 'weak-password') {
        message = "provided Password is too weak.. ";
      } else if (error.code == 'email-already-in-use') {
        message = 'Account already exists for that email.. ';
      } else {
        message = error.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displayUserName = auth.currentUser!.displayName!);

      isSignedId = true;
      authBox.write("auth", isSignedId);

      update();
      Get.offAllNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account  does not exists for that $email .. Create your account by signing up..';
      } else if (error.code == 'wrong-password') {
        message = 'Invalid Password .. Please try again!';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void googleSinUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googeSignIn.signIn();
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;

      isSignedId = true;
      authBox.write("auth", isSignedId);

      update();

      Get.offNamed(Routes.mainScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void faceBookSignUpApp() {}

  void restPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = error.code.replaceAll(RegExp('-'), ' ').capitalize!;
      String message = '';
      if (error.code == 'user-not-found') {
        message =
            'Account  does not exists for that $email .. Create your account by signing up..';
      } else {
        message = error.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googeSignIn.signOut();
      displayUserName = '';
      displayUserPhoto = '';

      isSignedId = false;
      authBox.remove("auth");
      update();

      Get.offAllNamed(Routes.welcomeScreen);
    } catch (error) {
      Get.snackbar(
        'Error!',
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }
}
