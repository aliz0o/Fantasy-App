import 'package:fantasy/ui/chose_player_screen.dart';
import 'package:fantasy/ui/widget/player_profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlayerInfoWidget extends StatefulWidget {
  final String position;
  final int id;
  final int playerId;
  final String playerName;
  final String playerImage;
  final bool isMe;

  PlayerInfoWidget(
      {this.position,
      this.isMe,
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
              if (widget.isMe) {
                Get.to(ChosePlayerScreen(
                  position: widget.position,
                  id: widget.id,
                ));
              }
            },
            child: Stack(
              children: [
                PlayerProfilePicture(
                    image: widget.playerId <= 0 ? null : widget.playerImage),
                if (widget.isMe)
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 17,
                        width: 17,
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
                          size: 8,
                          color: Colors.white,
                        ),
                      )),
              ],
            ),
          ),
          SizedBox(height: 1),
          Text(
            widget.playerId <= 0 ? '' : widget.playerName,
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
