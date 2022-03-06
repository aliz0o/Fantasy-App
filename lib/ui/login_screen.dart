import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:fantasy/view_model/firebase_view.model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    FirebaseViewModel viewModel = Get.put(FirebaseViewModel());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Welcome Back')),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Image.asset('images/splash.gif'),
            height: 330,
          ),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.only(
                topLeft:
                    Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
                topRight:
                    Radius.elliptical(MediaQuery.of(context).size.width, 100.0),
              ),
              color: Color(0xff184150),
              child: GetX<FirebaseViewModel>(
                init: FirebaseViewModel(),
                builder: (controller) => viewModel.isLoading.value
                    ? Container(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child:
                                CircularProgressIndicator(color: Colors.red)))
                    : viewModel.errorMessage.value != ''
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    viewModel.errorMessage.value,
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.red)),
                                    onPressed: () {
                                      viewModel.changeErrorMessage('');
                                      viewModel.changeIsLoadingStatus(false);
                                    },
                                    child: Text('Try Again'))
                              ],
                            )))
                        : Column(
                            children: [
                              SizedBox(height: 150),
                              Text('Login With',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)),
                              SizedBox(height: 15),
                              Center(
                                child: SignInButton(
                                  Buttons.Google,
                                  text: 'Google',
                                  onPressed: () async {
                                    viewModel.changeIsLoadingStatus(true);
                                    try {
                                      await viewModel.signInWithGoogle();
                                      if (FirebaseAuth.instance.currentUser !=
                                          null) {
                                        viewModel.addUsers();

                                        viewModel.changeIsLoadingStatus(false);
                                      }
                                    } catch (e) {
                                      if (e is FirebaseAuthException) {
                                        viewModel.changeIsLoadingStatus(false);
                                        viewModel.changeErrorMessage(e.message);
                                        log(e.message);
                                      }
                                    }

                                    viewModel.changeIsLoadingStatus(false);
                                  },
                                ),
                              ),
                              SizedBox(height: 5),
                              Center(
                                child: SignInButton(
                                  Buttons.Facebook,
                                  text: 'FaceBook',
                                  onPressed: () async {
                                    viewModel.changeIsLoadingStatus(true);

                                    try {
                                      await viewModel.signInFB();
                                      if (FirebaseAuth.instance.currentUser !=
                                          null) {
                                        viewModel.addUsers();
                                        viewModel.changeIsLoadingStatus(false);
                                      }
                                    } catch (e) {
                                      if (e is FirebaseAuthException) {
                                        viewModel.changeIsLoadingStatus(false);
                                        viewModel.changeErrorMessage(e.message);
                                        log(e.message);
                                      }
                                    }
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
