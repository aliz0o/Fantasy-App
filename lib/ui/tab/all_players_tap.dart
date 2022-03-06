import 'package:fantasy/ui/login_screen.dart';
import 'package:fantasy/view_model/all_players_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:fantasy/view_model/firebase_view.model.dart';

class AllPlayersTap extends StatefulWidget {
  @override
  _AllPlayersTapState createState() => _AllPlayersTapState();
}

class _AllPlayersTapState extends State<AllPlayersTap> {
  User user = FirebaseAuth.instance.currentUser;
  FirebaseViewModel viewModel = Get.put(FirebaseViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () async {
                viewModel.signOut();
                Get.offAll(LoginScreen());
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL),
          ),
          title: Text(
            user.displayName,
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            user.email,
            style: TextStyle(
              fontSize: 9,
              color: Colors.white.withOpacity(0.50),
              fontFamily: 'Product Sans',
            ),
          ),
        ),
      ),
      body: AllPlayersViewModel(),
    );
  }
}
