import 'package:fantasy/ui/widget/player_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fantasy/ui/home_screen.dart';

class HomeScreenTab extends StatefulWidget {
  @override
  _HomeScreenTabState createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              PlayerInfoWidget(
                  position: 'Position.ATTACKER',
                  id: 9,
                  playerId: playerId[9],
                  playerName: playerName[9],
                  playerImage: playerImage[9]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlayerInfoWidget(
                      position: 'Position.ATTACKER',
                      id: 8,
                      playerId: playerId[8],
                      playerName: playerName[8],
                      playerImage: playerImage[8]),
                  SizedBox(width: 30),
                  PlayerInfoWidget(
                      position: 'Position.ATTACKER',
                      id: 10,
                      playerId: playerId[10],
                      playerName: playerName[10],
                      playerImage: playerImage[10]),
                ],
              ),
              SizedBox(height: 50),
              PlayerInfoWidget(
                  position: 'Position.MIDFIELDER',
                  id: 6,
                  playerId: playerId[6],
                  playerName: playerName[6],
                  playerImage: playerImage[6]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlayerInfoWidget(
                      position: 'Position.MIDFIELDER',
                      id: 5,
                      playerId: playerId[5],
                      playerName: playerName[5],
                      playerImage: playerImage[5]),
                  SizedBox(width: 60),
                  PlayerInfoWidget(
                      position: 'Position.MIDFIELDER',
                      id: 7,
                      playerId: playerId[7],
                      playerName: playerName[7],
                      playerImage: playerImage[7]),
                ],
              ),
              SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlayerInfoWidget(
                      position: 'Position.DEFENDER',
                      id: 1,
                      playerId: playerId[1],
                      playerName: playerName[1],
                      playerImage: playerImage[1]),
                  SizedBox(width: 160),
                  PlayerInfoWidget(
                      position: 'Position.DEFENDER',
                      id: 4,
                      playerId: playerId[4],
                      playerName: playerName[4],
                      playerImage: playerImage[4]),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlayerInfoWidget(
                      position: 'Position.DEFENDER',
                      id: 2,
                      playerId: playerId[2],
                      playerName: playerName[2],
                      playerImage: playerImage[2]),
                  SizedBox(
                      width: GetPlatform.isWeb &&
                              MediaQuery.of(context).orientation ==
                                  Orientation.landscape
                          ? 160
                          : 60),
                  PlayerInfoWidget(
                      position: 'Position.DEFENDER',
                      id: 3,
                      playerId: playerId[3],
                      playerName: playerName[3],
                      playerImage: playerImage[3]),
                ],
              ),
              SizedBox(height: 45),
              PlayerInfoWidget(
                  position: 'Position.GOALKEEPER',
                  id: 0,
                  playerId: playerId[0],
                  playerName: playerName[0],
                  playerImage: playerImage[0]),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
