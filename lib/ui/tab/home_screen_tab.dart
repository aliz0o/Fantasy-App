import 'package:fantasy/ui/widget/player_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasy/ui/home_screen.dart';
import 'package:get/get.dart';

class HomeScreenTab extends StatefulWidget {
  final String userID;
  HomeScreenTab({@required this.userID});
  @override
  _HomeScreenTabState createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      floatingActionButton: user.uid == widget.userID
          ? Container()
          : FloatingActionButton.extended(
              backgroundColor: Colors.black.withOpacity(0.80),
              foregroundColor: Colors.white,
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: 15),
              label: Text('BACK', style: TextStyle(fontSize: 10)),
            ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(widget.userID).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError)
            return Center(child: Text('SomeThing Went Wrong .. '));
          if (snapshot.hasData) {
            Map<String, dynamic> data = snapshot.data.data();
            if (data != null)
              return SafeArea(
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage("images/football_pitch_landscape3.png"),
                        fit: GetPlatform.isWeb &&
                                MediaQuery.of(context).orientation ==
                                    Orientation.landscape
                            ? BoxFit.fill
                            : BoxFit.cover,
                      ),
                    )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        PlayerInfoWidget(
                            position: 'Position.ATTACKER',
                            isMe: user.uid == widget.userID,
                            id: 9,
                            playerId: data['playersID'][9],
                            playerName: data['playersName'][9],
                            playerImage: data['playersImage'][9]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerInfoWidget(
                                position: 'Position.ATTACKER',
                                isMe: user.uid == widget.userID,
                                id: 8,
                                playerId: data['playersID'][8],
                                playerName: data['playersName'][8],
                                playerImage: data['playersImage'][8]),
                            SizedBox(width: 30),
                            PlayerInfoWidget(
                                position: 'Position.ATTACKER',
                                isMe: user.uid == widget.userID,
                                id: 10,
                                playerId: data['playersID'][10],
                                playerName: data['playersName'][10],
                                playerImage: data['playersImage'][10]),
                          ],
                        ),
                        SizedBox(height: 50),
                        PlayerInfoWidget(
                            position: 'Position.MIDFIELDER',
                            isMe: user.uid == widget.userID,
                            id: 6,
                            playerId: data['playersID'][6],
                            playerName: data['playersName'][6],
                            playerImage: data['playersImage'][6]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerInfoWidget(
                                position: 'Position.MIDFIELDER',
                                isMe: user.uid == widget.userID,
                                id: 5,
                                playerId: data['playersID'][5],
                                playerName: data['playersName'][5],
                                playerImage: data['playersImage'][5]),
                            SizedBox(width: 60),
                            PlayerInfoWidget(
                                position: 'Position.MIDFIELDER',
                                isMe: user.uid == widget.userID,
                                id: 7,
                                playerId: data['playersID'][7],
                                playerName: data['playersName'][7],
                                playerImage: data['playersImage'][7]),
                          ],
                        ),
                        SizedBox(height: 70),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            PlayerInfoWidget(
                                position: 'Position.DEFENDER',
                                isMe: user.uid == widget.userID,
                                id: 1,
                                playerId: data['playersID'][1],
                                playerName: data['playersName'][1],
                                playerImage: data['playersImage'][1]),
                            SizedBox(width: 160),
                            PlayerInfoWidget(
                                position: 'Position.DEFENDER',
                                isMe: user.uid == widget.userID,
                                id: 4,
                                playerId: data['playersID'][4],
                                playerName: data['playersName'][4],
                                playerImage: data['playersImage'][4]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PlayerInfoWidget(
                                position: 'Position.DEFENDER',
                                isMe: user.uid == widget.userID,
                                id: 2,
                                playerId: data['playersID'][2],
                                playerName: data['playersName'][2],
                                playerImage: data['playersImage'][2]),
                            SizedBox(
                                width: GetPlatform.isWeb &&
                                        MediaQuery.of(context).orientation ==
                                            Orientation.landscape
                                    ? 160
                                    : 60),
                            PlayerInfoWidget(
                                position: 'Position.DEFENDER',
                                isMe: user.uid == widget.userID,
                                id: 3,
                                playerId: data['playersID'][3],
                                playerName: data['playersName'][3],
                                playerImage: data['playersImage'][3]),
                          ],
                        ),
                        SizedBox(height: 45),
                        PlayerInfoWidget(
                            position: 'Position.GOALKEEPER',
                            isMe: user.uid == widget.userID,
                            id: 0,
                            playerId: data['playersID'][0],
                            playerName: data['playersName'][0],
                            playerImage: data['playersImage'][0]),
                        SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              );
          }

          return SafeArea(
              child: Stack(children: [
            Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/football_pitch_landscape3.png"),
                fit: GetPlatform.isWeb &&
                        MediaQuery.of(context).orientation ==
                            Orientation.landscape
                    ? BoxFit.fill
                    : BoxFit.cover,
              ),
            )),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black.withOpacity(0.70),
            ),
            Center(
              child: Container(
                  height: 15,
                  width: 15,
                  child: CircularProgressIndicator(color: Colors.red)),
            ),
          ]));
        },
      ),
    );
  }
}
