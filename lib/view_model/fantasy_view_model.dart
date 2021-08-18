import 'package:get/get.dart';
import 'package:fantasy/network/api.dart';
import 'package:fantasy/model/players_model.dart';
import 'dart:developer';

class FantasyViewModel extends GetxController {
  final isLoading = false.obs;

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
}
