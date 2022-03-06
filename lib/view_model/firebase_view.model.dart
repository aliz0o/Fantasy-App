import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/ui/home_screen.dart';

class FirebaseViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final isLoading = false.obs;
  final fbLogin = FacebookLogin();
  final errorMessage = ''.obs;

  changeIsLoadingStatus(bool status) {
    isLoading.value = status;
    update();
  }

  changeErrorMessage(String message) {
    errorMessage.value = message;
    update();
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      log(e.message);
      throw e;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future signInFB() async {
    final FacebookLoginResult result =
        await fbLogin.logIn(["email", "public_profile"]);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final String token = result.accessToken.token;
        final AuthCredential authCredential =
            FacebookAuthProvider.credential(token);
        await FirebaseAuth.instance.signInWithCredential(authCredential);
        break;
      case FacebookLoginStatus.cancelledByUser:
        break;
      case FacebookLoginStatus.error:
        log('Error while log in: ${result.errorMessage}');
        break;
    }
  }

  addUsers() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        Get.off(HomeScreen());
      } else {
        _fireStore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .set({
          'email': FirebaseAuth.instance.currentUser.email,
          'name': FirebaseAuth.instance.currentUser.displayName,
          'createdOn': FieldValue.serverTimestamp(),
          'imageUrl': FirebaseAuth.instance.currentUser.photoURL,
          'userID': FirebaseAuth.instance.currentUser.uid,
          'playersName': FieldValue.arrayUnion([
            '0',
            '-1',
            '-2',
            '-3',
            '-4',
            '-5',
            '-6',
            '-7',
            '-8',
            '-9',
            '-10'
          ]),
          'playersImage': FieldValue.arrayUnion([
            '0',
            '-1',
            '-2',
            '-3',
            '-4',
            '-5',
            '-6',
            '-7',
            '-8',
            '-9',
            '-10'
          ]),
          'playersID': FieldValue.arrayUnion(
              [0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10]),
        });
        Get.off(HomeScreen());
      }
    });
  }
}
