import 'package:flutter/material.dart';

class PlayerProfilePicture extends StatefulWidget {
  final String image;
  PlayerProfilePicture({this.image});

  @override
  _PlayerProfilePictureState createState() => _PlayerProfilePictureState();
}

class _PlayerProfilePictureState extends State<PlayerProfilePicture> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 57,
        height: 57,
        decoration: BoxDecoration(
          color: widget.image != null
              ? Colors.white
              : Color(0xff434372).withOpacity(0.85),
          border: Border.all(
              width: widget.image != null ? 0 : 3,
              color: Theme.of(context).scaffoldBackgroundColor),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.4),
                offset: Offset(0, 10))
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: widget.image != null ? BoxFit.cover : BoxFit.cover,
            image: widget.image != null
                ? NetworkImage(widget.image)
                : AssetImage('images/splash.gif'),
          ),
        ));
  }
}
