import 'package:fantasy/model/players_model.dart';
import 'api_url.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;

// key1 = abe1d18d1bmsh65a2c931549f680p10c951jsneb4f75b95c13
// key2 = 7298b2b4cbmsh7de033dfb143233p1911a3jsn60b188f49fee
// key3 = d742b1166amsh083fd35dfb2dfd3p1a038cjsn4be705f6a784

class Api {
  var header = {
    'x-rapidapi-key': '7298b2b4cbmsh7de033dfb143233p1911a3jsn60b188f49fee',
    'x-rapidapi-host': 'api-football-v1.p.rapidapi.com'
  };
  Future<PlayersModel> getPlayers(int pageKey) async {
    String url = '${ApiUrl.fantasyUrl}';
    var uri = Uri.parse(url + pageKey.toString());
    log("URL : $uri");
    var response = await http.get(uri, headers: header);
    PlayersModel playersModel = playersModelFromJson(response.body);
    return playersModel;
  }

  Future<PlayersModel> getPlayersByPlayerId(int playerId) async {
    String url = '${ApiUrl.getPlayerByPlayerIdUrl}';
    var uri = Uri.parse(url + playerId.toString());
    log("URL : $uri");
    var response = await http.get(uri, headers: header);
    PlayersModel playersModel = playersModelFromJson(response.body);
    return playersModel;
  }

  Future<PlayersModel> getPlayersBySearch(String term) async {
    String url = '${ApiUrl.getBlyerBySearchUrl}';
    var uri = Uri.parse(url + term);
    log("URL : $uri");
    var response = await http.get(uri, headers: header);
    PlayersModel playersModel = playersModelFromJson(response.body);
    return playersModel;
  }
}
