import 'package:get/get.dart';
import 'package:fantasy/network/api.dart';
import 'package:fantasy/model/players_model.dart';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fantasy/ui/home_screen.dart';

class FantasyViewModel extends GetxController {
  final _fireStore = FirebaseFirestore.instance;

  final isLoading = false.obs;
  final playerCounter = 0.obs;

  final players = PlayersModel().obs;
  List allPlayers = [].obs;
  List<PlayersModel> playersById = <PlayersModel>[].obs;
  final index = 0.obs;

  List<bool> isSelected = List.generate(5, (index) => false).obs;

  changeIsLoadingStatus(bool status) {
    isLoading.value = status;
    update();
  }

  getData(int pageKey) async {
    changeIsLoadingStatus(true);
    if (pageKey == 1) allPlayers.clear();
    players.value = await Api().getPlayers(pageKey);
    for (int index = 0; index < players.value.results; index++) {
      allPlayers.add(players.value.response[index]);
      log(players.value.response[index].player.name);
    }

    changeIsLoadingStatus(false);
  }

  getDataWithoutLoading(int pageKey) async {
    players.value = await Api().getPlayers(pageKey);
    for (int index = 0; index < players.value.results; index++) {
      allPlayers.add(players.value.response[index]);
    }
    update();
  }

  getPlayerByPlayerId(int id, int playerId) async {
    playersById.length = 11;
    if (playerId == null) {
    } else {
      playersById[id] = await Api().getPlayersByPlayerId(playerId);
      log(playersById[id].response.first.player.name);
    }
  }

  getPlayerBySearch(String term) async {
    changeIsLoadingStatus(true);
    players.value = await Api().getPlayersBySearch(term);
    allPlayers.clear();
    for (int index = 0; index < players.value.results; index++) {
      allPlayers.add(players.value.response[index]);
      log(allPlayers[index].player.name);
    }
    changeIsLoadingStatus(false);
  }

  updatePlayerList(
      {int id, int playerID, String playerName, String playerImage}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        Map<String, dynamic> data = documentSnapshot.data();
        playersID = data['playersID'];
        playersName = data['playersName'];
        playersImage = data['playersImage'];
        //
        if (playersID.length != 11) {
          playersID.add(-10);
          playersName.add('-10');
          playersImage.add('-10');
        }
        playersID[id] = playerID;
        playersName[id] = playerName;
        playersImage[id] = playerImage;
        await _fireStore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .update({
          'playersName': FieldValue.delete(),
          'playersImage': FieldValue.delete(),
          'playersID': FieldValue.delete(),
        });
        await _fireStore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser.uid)
            .update({
          'playersName': FieldValue.arrayUnion(playersName),
          'playersImage': FieldValue.arrayUnion(playersImage),
          'playersID': FieldValue.arrayUnion(playersID),
        });
        Get.off(HomeScreen());
      }
    });
  }
}
