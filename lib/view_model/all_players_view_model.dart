import 'package:fantasy/ui/tab/home_screen_tab.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class AllPlayersViewModel extends StatefulWidget {
  @override
  _AllPlayersViewModelState createState() => _AllPlayersViewModelState();
}

class _AllPlayersViewModelState extends State<AllPlayersViewModel> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 75.0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.black.withOpacity(0.5),
                    highlightColor: Colors.blueGrey.withOpacity(0.5),
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text(
                        '________',
                        style:
                            TextStyle(fontSize: 25, fontFamily: 'Product Sans'),
                      ),
                      subtitle: Text(
                        '______________',
                        style:
                            TextStyle(fontSize: 20, fontFamily: 'Product Sans'),
                      ),
                    ),
                  ),
                );
              });
        }

        return ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data() as Map<String, dynamic>;
            return data['email'] == user.email
                ? Container()
                : InkWell(
                    onTap: () {
                      Get.to(HomeScreenTab(userID: data['userID']));
                    },
                    child: Card(
                      elevation: 10,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data['imageUrl']),
                        ),
                        title: Text(
                          data['name'],
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          data['email'],
                          style: TextStyle(
                            fontSize: 9,
                            color: Colors.black.withOpacity(0.50),
                            fontFamily: 'Product Sans',
                          ),
                        ),
                      ),
                    ),
                  );
          }).toList(),
        );
      },
    );
  }
}
