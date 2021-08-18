// To parse this JSON data, do
//
//     final playersModel = playersModelFromJson(jsonString);

import 'dart:convert';

PlayersModel playersModelFromJson(String str) =>
    PlayersModel.fromJson(json.decode(str));

String playersModelToJson(PlayersModel data) => json.encode(data.toJson());

class PlayersModel {
  PlayersModel({
    this.playersModelGet,
    this.parameters,
    this.errors,
    this.results,
    this.paging,
    this.response,
  });

  String playersModelGet;
  Parameters parameters;
  List<dynamic> errors;
  int results;
  Paging paging;
  List<Response> response;

  factory PlayersModel.fromJson(Map<String, dynamic> json) => PlayersModel(
        playersModelGet: json["get"] == null ? null : json["get"],
        parameters: json["parameters"] == null
            ? null
            : Parameters.fromJson(json["parameters"]),
        errors: json["errors"] == null
            ? null
            : List<dynamic>.from(json["errors"].map((x) => x)),
        results: json["results"] == null ? null : json["results"],
        paging: json["paging"] == null ? null : Paging.fromJson(json["paging"]),
        response: json["response"] == null
            ? null
            : List<Response>.from(
                json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "get": playersModelGet == null ? null : playersModelGet,
        "parameters": parameters == null ? null : parameters.toJson(),
        "errors":
            errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
        "results": results == null ? null : results,
        "paging": paging == null ? null : paging.toJson(),
        "response": response == null
            ? null
            : List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Paging {
  Paging({
    this.current,
    this.total,
  });

  int current;
  int total;

  factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        current: json["current"] == null ? null : json["current"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current": current == null ? null : current,
        "total": total == null ? null : total,
      };
}

class Parameters {
  Parameters({
    this.league,
    this.page,
    this.season,
  });

  String league;
  String page;
  String season;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        league: json["league"] == null ? null : json["league"],
        page: json["page"] == null ? null : json["page"],
        season: json["season"] == null ? null : json["season"],
      );

  Map<String, dynamic> toJson() => {
        "league": league == null ? null : league,
        "page": page == null ? null : page,
        "season": season == null ? null : season,
      };
}

class Response {
  Response({
    this.player,
    this.statistics,
  });

  Player player;
  List<Statistic> statistics;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        player: json["player"] == null ? null : Player.fromJson(json["player"]),
        statistics: json["statistics"] == null
            ? null
            : List<Statistic>.from(
                json["statistics"].map((x) => Statistic.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "player": player == null ? null : player.toJson(),
        "statistics": statistics == null
            ? null
            : List<dynamic>.from(statistics.map((x) => x.toJson())),
      };
}

class Player {
  Player({
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.age,
    this.birth,
    this.nationality,
    this.height,
    this.weight,
    this.injured,
    this.photo,
  });

  int id;
  String name;
  String firstname;
  String lastname;
  int age;
  Birth birth;
  String nationality;
  String height;
  String weight;
  bool injured;
  String photo;

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        age: json["age"] == null ? null : json["age"],
        birth: json["birth"] == null ? null : Birth.fromJson(json["birth"]),
        nationality: json["nationality"] == null ? null : json["nationality"],
        height: json["height"] == null ? null : json["height"],
        weight: json["weight"] == null ? null : json["weight"],
        injured: json["injured"] == null ? null : json["injured"],
        photo: json["photo"] == null ? null : json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "age": age == null ? null : age,
        "birth": birth == null ? null : birth.toJson(),
        "nationality": nationality == null ? null : nationality,
        "height": height == null ? null : height,
        "weight": weight == null ? null : weight,
        "injured": injured == null ? null : injured,
        "photo": photo == null ? null : photo,
      };
}

class Birth {
  Birth({
    this.date,
    this.place,
    this.country,
  });

  DateTime date;
  String place;
  String country;

  factory Birth.fromJson(Map<String, dynamic> json) => Birth(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        place: json["place"] == null ? null : json["place"],
        country: json["country"] == null ? null : json["country"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "place": place == null ? null : place,
        "country": country == null ? null : country,
      };
}

class Statistic {
  Statistic({
    this.team,
    this.league,
    this.games,
    this.substitutes,
    this.shots,
    this.goals,
    this.passes,
    this.tackles,
    this.duels,
    this.dribbles,
    this.fouls,
    this.cards,
    this.penalty,
  });

  Team team;
  League league;
  Games games;
  Substitutes substitutes;
  Shots shots;
  Goals goals;
  Passes passes;
  Tackles tackles;
  Duels duels;
  Dribbles dribbles;
  Fouls fouls;
  Cards cards;
  Penalty penalty;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        team: json["team"] == null ? null : Team.fromJson(json["team"]),
        league: json["league"] == null ? null : League.fromJson(json["league"]),
        games: json["games"] == null ? null : Games.fromJson(json["games"]),
        substitutes: json["substitutes"] == null
            ? null
            : Substitutes.fromJson(json["substitutes"]),
        shots: json["shots"] == null ? null : Shots.fromJson(json["shots"]),
        goals: json["goals"] == null ? null : Goals.fromJson(json["goals"]),
        passes: json["passes"] == null ? null : Passes.fromJson(json["passes"]),
        tackles:
            json["tackles"] == null ? null : Tackles.fromJson(json["tackles"]),
        duels: json["duels"] == null ? null : Duels.fromJson(json["duels"]),
        dribbles: json["dribbles"] == null
            ? null
            : Dribbles.fromJson(json["dribbles"]),
        fouls: json["fouls"] == null ? null : Fouls.fromJson(json["fouls"]),
        cards: json["cards"] == null ? null : Cards.fromJson(json["cards"]),
        penalty:
            json["penalty"] == null ? null : Penalty.fromJson(json["penalty"]),
      );

  Map<String, dynamic> toJson() => {
        "team": team == null ? null : team.toJson(),
        "league": league == null ? null : league.toJson(),
        "games": games == null ? null : games.toJson(),
        "substitutes": substitutes == null ? null : substitutes.toJson(),
        "shots": shots == null ? null : shots.toJson(),
        "goals": goals == null ? null : goals.toJson(),
        "passes": passes == null ? null : passes.toJson(),
        "tackles": tackles == null ? null : tackles.toJson(),
        "duels": duels == null ? null : duels.toJson(),
        "dribbles": dribbles == null ? null : dribbles.toJson(),
        "fouls": fouls == null ? null : fouls.toJson(),
        "cards": cards == null ? null : cards.toJson(),
        "penalty": penalty == null ? null : penalty.toJson(),
      };
}

class Cards {
  Cards({
    this.yellow,
    this.yellowred,
    this.red,
  });

  int yellow;
  int yellowred;
  int red;

  factory Cards.fromJson(Map<String, dynamic> json) => Cards(
        yellow: json["yellow"] == null ? null : json["yellow"],
        yellowred: json["yellowred"] == null ? null : json["yellowred"],
        red: json["red"] == null ? null : json["red"],
      );

  Map<String, dynamic> toJson() => {
        "yellow": yellow == null ? null : yellow,
        "yellowred": yellowred == null ? null : yellowred,
        "red": red == null ? null : red,
      };
}

class Dribbles {
  Dribbles({
    this.attempts,
    this.success,
    this.past,
  });

  int attempts;
  int success;
  dynamic past;

  factory Dribbles.fromJson(Map<String, dynamic> json) => Dribbles(
        attempts: json["attempts"] == null ? null : json["attempts"],
        success: json["success"] == null ? null : json["success"],
        past: json["past"],
      );

  Map<String, dynamic> toJson() => {
        "attempts": attempts == null ? null : attempts,
        "success": success == null ? null : success,
        "past": past,
      };
}

class Duels {
  Duels({
    this.total,
    this.won,
  });

  int total;
  int won;

  factory Duels.fromJson(Map<String, dynamic> json) => Duels(
        total: json["total"] == null ? null : json["total"],
        won: json["won"] == null ? null : json["won"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "won": won == null ? null : won,
      };
}

class Fouls {
  Fouls({
    this.drawn,
    this.committed,
  });

  int drawn;
  int committed;

  factory Fouls.fromJson(Map<String, dynamic> json) => Fouls(
        drawn: json["drawn"] == null ? null : json["drawn"],
        committed: json["committed"] == null ? null : json["committed"],
      );

  Map<String, dynamic> toJson() => {
        "drawn": drawn == null ? null : drawn,
        "committed": committed == null ? null : committed,
      };
}

class Games {
  Games({
    this.appearences,
    this.lineups,
    this.minutes,
    this.number,
    this.position,
    this.rating,
    this.captain,
  });

  int appearences;
  int lineups;
  int minutes;
  dynamic number;
  Position position;
  String rating;
  bool captain;

  factory Games.fromJson(Map<String, dynamic> json) => Games(
        appearences: json["appearences"] == null ? null : json["appearences"],
        lineups: json["lineups"] == null ? null : json["lineups"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        number: json["number"],
        position: json["position"] == null
            ? null
            : positionValues.map[json["position"]],
        rating: json["rating"] == null ? null : json["rating"],
        captain: json["captain"] == null ? null : json["captain"],
      );

  Map<String, dynamic> toJson() => {
        "appearences": appearences == null ? null : appearences,
        "lineups": lineups == null ? null : lineups,
        "minutes": minutes == null ? null : minutes,
        "number": number,
        "position": position == null ? null : positionValues.reverse[position],
        "rating": rating == null ? null : rating,
        "captain": captain == null ? null : captain,
      };
}

enum Position { ATTACKER, DEFENDER, MIDFIELDER, GOALKEEPER }

final positionValues = EnumValues({
  "Attacker": Position.ATTACKER,
  "Defender": Position.DEFENDER,
  "Goalkeeper": Position.GOALKEEPER,
  "Midfielder": Position.MIDFIELDER
});

class Goals {
  Goals({
    this.total,
    this.conceded,
    this.assists,
    this.saves,
  });

  int total;
  int conceded;
  int assists;
  dynamic saves;

  factory Goals.fromJson(Map<String, dynamic> json) => Goals(
        total: json["total"] == null ? null : json["total"],
        conceded: json["conceded"] == null ? null : json["conceded"],
        assists: json["assists"] == null ? null : json["assists"],
        saves: json["saves"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "conceded": conceded == null ? null : conceded,
        "assists": assists == null ? null : assists,
        "saves": saves,
      };
}

class League {
  League({
    this.id,
    this.name,
    this.country,
    this.logo,
    this.flag,
    this.season,
  });

  int id;
  Name name;
  Country country;
  String logo;
  String flag;
  int season;

  factory League.fromJson(Map<String, dynamic> json) => League(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        country:
            json["country"] == null ? null : countryValues.map[json["country"]],
        logo: json["logo"] == null ? null : json["logo"],
        flag: json["flag"] == null ? null : json["flag"],
        season: json["season"] == null ? null : json["season"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : nameValues.reverse[name],
        "country": country == null ? null : countryValues.reverse[country],
        "logo": logo == null ? null : logo,
        "flag": flag == null ? null : flag,
        "season": season == null ? null : season,
      };
}

enum Country { ENGLAND }

final countryValues = EnumValues({"England": Country.ENGLAND});

enum Name { PREMIER_LEAGUE }

final nameValues = EnumValues({"Premier League": Name.PREMIER_LEAGUE});

class Passes {
  Passes({
    this.total,
    this.key,
    this.accuracy,
  });

  int total;
  int key;
  int accuracy;

  factory Passes.fromJson(Map<String, dynamic> json) => Passes(
        total: json["total"] == null ? null : json["total"],
        key: json["key"] == null ? null : json["key"],
        accuracy: json["accuracy"] == null ? null : json["accuracy"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "key": key == null ? null : key,
        "accuracy": accuracy == null ? null : accuracy,
      };
}

class Penalty {
  Penalty({
    this.won,
    this.commited,
    this.scored,
    this.missed,
    this.saved,
  });

  dynamic won;
  dynamic commited;
  int scored;
  int missed;
  int saved;

  factory Penalty.fromJson(Map<String, dynamic> json) => Penalty(
        won: json["won"],
        commited: json["commited"],
        scored: json["scored"] == null ? null : json["scored"],
        missed: json["missed"] == null ? null : json["missed"],
        saved: json["saved"] == null ? null : json["saved"],
      );

  Map<String, dynamic> toJson() => {
        "won": won,
        "commited": commited,
        "scored": scored == null ? null : scored,
        "missed": missed == null ? null : missed,
        "saved": saved == null ? null : saved,
      };
}

class Shots {
  Shots({
    this.total,
    this.on,
  });

  int total;
  int on;

  factory Shots.fromJson(Map<String, dynamic> json) => Shots(
        total: json["total"] == null ? null : json["total"],
        on: json["on"] == null ? null : json["on"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "on": on == null ? null : on,
      };
}

class Substitutes {
  Substitutes({
    this.substitutesIn,
    this.out,
    this.bench,
  });

  int substitutesIn;
  int out;
  int bench;

  factory Substitutes.fromJson(Map<String, dynamic> json) => Substitutes(
        substitutesIn: json["in"] == null ? null : json["in"],
        out: json["out"] == null ? null : json["out"],
        bench: json["bench"] == null ? null : json["bench"],
      );

  Map<String, dynamic> toJson() => {
        "in": substitutesIn == null ? null : substitutesIn,
        "out": out == null ? null : out,
        "bench": bench == null ? null : bench,
      };
}

class Tackles {
  Tackles({
    this.total,
    this.blocks,
    this.interceptions,
  });

  int total;
  int blocks;
  int interceptions;

  factory Tackles.fromJson(Map<String, dynamic> json) => Tackles(
        total: json["total"] == null ? null : json["total"],
        blocks: json["blocks"] == null ? null : json["blocks"],
        interceptions:
            json["interceptions"] == null ? null : json["interceptions"],
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "blocks": blocks == null ? null : blocks,
        "interceptions": interceptions == null ? null : interceptions,
      };
}

class Team {
  Team({
    this.id,
    this.name,
    this.logo,
  });

  int id;
  String name;
  String logo;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        logo: json["logo"] == null ? null : json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "logo": logo == null ? null : logo,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
