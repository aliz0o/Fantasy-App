import 'package:fantasy/ui/chose_player_screen.dart';
import 'package:fantasy/ui/widget/player_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class PlayerInfoWidget extends StatefulWidget {
  final String position;
  final int id;
  final int playerId;
  final String playerName;
  final String playerImage;

  PlayerInfoWidget(
      {this.position,
      this.id,
      this.playerId,
      this.playerName,
      this.playerImage});
  @override
  _PlayerInfoWidgetState createState() => _PlayerInfoWidgetState();
}

class _PlayerInfoWidgetState extends State<PlayerInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.playerId == null
                  ? Get.to(ChosePlayerScreen(
                      position: widget.position,
                      id: widget.id,
                    ))
                  : log(widget.position);
            },
            child: Stack(
              children: [
                PlayerProfilePicture(
                    image: widget.playerId == null ? null : widget.playerImage),
                if (widget.playerId == null)
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 2.5,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          size: 10,
                          color: Colors.white,
                        ),
                      )),
              ],
            ),
          ),
          SizedBox(height: 1),
          Text(
            widget.playerId != null ? widget.playerName : '',
            style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                backgroundColor: Colors.black.withOpacity(0.1)),
          ),
        ],
      ),
    );
  }
}
