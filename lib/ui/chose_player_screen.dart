import 'package:fantasy/ui/home_screen.dart';
import 'package:fantasy/ui/widget/player_profile_picture.dart';
import 'package:fantasy/view_model/fantasy_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ChosePlayerScreen extends StatefulWidget {
  final String position;
  final int id;

  ChosePlayerScreen({this.position, this.id});

  @override
  _ChosePlayerScreenState createState() => _ChosePlayerScreenState();
}

class _ChosePlayerScreenState extends State<ChosePlayerScreen> {
  ScrollController _controller;
  int pageKey = 1;
  FantasyViewModel viewModel = Get.put(FantasyViewModel());
  List<bool> visible = [];
  bool showSearchBar = false;

  List<String> position = [
    'ALL',
    'Position.GOALKEEPER',
    'Position.DEFENDER',
    'Position.MIDFIELDER',
    'Position.ATTACKER'
  ];
  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange &&
        pageKey < viewModel.players.value.paging.total) {
      viewModel.getDataWithoutLoading(++pageKey);
    }
  }

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    viewModel.isSelected.assignAll([true, false, false, false, false]);
    viewModel.index.value = 0;
    viewModel.getData(pageKey);
    viewModel.playerCounter.value = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String term = '';
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            showSearchBar
                ? setState(() {
                    showSearchBar = false;
                  })
                : Get.off(() => HomeScreen());
          },
        ),
        actions: [
          showSearchBar
              ? Container()
              : IconButton(
                  icon: Icon(Icons.search_sharp),
                  onPressed: () {
                    showSearchBar = true;
                    setState(() {});
                  },
                )
        ],
        title: showSearchBar
            ? TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  term = value;
                },
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintText: 'Insert More Than 3 Letters ...',
                    hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.50), fontSize: 12.5),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {
                        if (term.length < 4) {
                        } else {
                          FocusScope.of(context).unfocus();
                          viewModel.getPlayerBySearch(term);
                        }
                      },
                    )),
              )
            : Text(
                widget.position.substring(9) + ' PLAYERS',
              ),
      ),
      body: SafeArea(
        child: GetX<FantasyViewModel>(
          init: FantasyViewModel(),
          builder: (controller) => viewModel.isLoading.value
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                ))
              : SingleChildScrollView(
                  controller: _controller,
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: ToggleButtons(
                          constraints:
                              BoxConstraints(minHeight: 30, minWidth: 75),
                          textStyle: TextStyle(fontSize: 10),
                          borderWidth: 2,
                          borderRadius: BorderRadius.circular(10),
                          isSelected: viewModel.isSelected,
                          onPressed: (index) {
                            viewModel.isSelected
                                .assignAll([false, false, false, false, false]);
                            viewModel.isSelected[index] = true;
                            viewModel.index.value = index;
                            viewModel.playerCounter.value = 0;
                            viewModel.update();
                          },
                          children: [
                            Text('ALL'),
                            Text('GOALKEEPER'),
                            Text('DEFENDER'),
                            Text('MIDFIELDER'),
                            Text('ATTACKER'),
                          ],
                        ),
                      ),
                      SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                pageKey < viewModel.players.value.paging.total
                                    ? viewModel.allPlayers.length + 1
                                    : viewModel.allPlayers.length,
                            itemBuilder: (BuildContext context, int index) {
                              if (index >= viewModel.allPlayers.length &&
                                  pageKey <
                                      viewModel.players.value.paging.total) {
                                if (viewModel.playerCounter.value < 20 &&
                                    viewModel.isSelected[0] == false) {
                                  viewModel.getDataWithoutLoading(++pageKey);
                                }
                                return Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 15,
                                    width: 15,
                                    child: CircularProgressIndicator(
                                      color: Colors.red,
                                    ),
                                  ),
                                ));
                              }
                              if ((viewModel.allPlayers[index].statistics.first
                                              .games.position
                                              .toString() ==
                                          position[viewModel.index.value] ||
                                      viewModel.index.value == 0) &&
                                  !playersID.contains(
                                      viewModel.allPlayers[index].player.id)) {
                                viewModel.playerCounter.value++;
                                visible.add(false);
                                return Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: InkWell(
                                    onTap: () {
                                      viewModel.changeIsLoadingStatus(true);
                                      viewModel.updatePlayerList(
                                          id: widget.id,
                                          playerID: viewModel
                                              .allPlayers[index].player.id,
                                          playerName: viewModel
                                              .allPlayers[index].player.name,
                                          playerImage: viewModel
                                              .allPlayers[index].player.photo);
                                    },
                                    child: Card(
                                      elevation: 10,
                                      child: Column(
                                        crossAxisAlignment: GetPlatform.isWeb &&
                                                MediaQuery.of(context)
                                                        .orientation ==
                                                    Orientation.landscape
                                            ? CrossAxisAlignment.start
                                            : CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      PlayerProfilePicture(
                                                          image: viewModel
                                                              .allPlayers[index]
                                                              .player
                                                              .photo),
                                                      SizedBox(width: 20),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            viewModel
                                                                .allPlayers[
                                                                    index]
                                                                .player
                                                                .name,
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 10),
                                                          ),
                                                          RatingBar.builder(
                                                            itemSize: 12.5,
                                                            initialRating: viewModel
                                                                        .allPlayers[
                                                                            index]
                                                                        .statistics
                                                                        .first
                                                                        .games
                                                                        .rating !=
                                                                    null
                                                                ? double.parse(viewModel
                                                                        .allPlayers[
                                                                            index]
                                                                        .statistics
                                                                        .first
                                                                        .games
                                                                        .rating) /
                                                                    2
                                                                : 0,
                                                            minRating: 0,
                                                            direction:
                                                                Axis.horizontal,
                                                            allowHalfRating:
                                                                true,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        0.5),
                                                            itemBuilder:
                                                                (context, _) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color: Colors
                                                                  .blueAccent,
                                                            ),
                                                            onRatingUpdate:
                                                                (rating) {
                                                              print(rating);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ]),
                                              ),
                                              Flexible(
                                                  child: SizedBox(width: 200)),
                                              Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: new BoxDecoration(
                                                    image: new DecorationImage(
                                                      image: new NetworkImage(
                                                          viewModel
                                                              .allPlayers[index]
                                                              .statistics
                                                              .first
                                                              .team
                                                              .logo
                                                              .toString()),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                              if (!(GetPlatform.isWeb &&
                                                  MediaQuery.of(context)
                                                          .orientation ==
                                                      Orientation.landscape))
                                                IconButton(
                                                    onPressed: () {
                                                      visible[index] =
                                                          !visible[index];
                                                      setState(() {});
                                                    },
                                                    icon: Icon(visible[index]
                                                        ? Icons.arrow_drop_up
                                                        : Icons
                                                            .arrow_drop_down))
                                            ],
                                          ),
                                          visible[index] ||
                                                  GetPlatform.isWeb &&
                                                      MediaQuery.of(context)
                                                              .orientation ==
                                                          Orientation.landscape
                                              ? DataTable(
                                                  columnSpacing: 170,
                                                  columns: <DataColumn>[
                                                    DataColumn(
                                                      label:
                                                          Text('Nationality'),
                                                    ),
                                                    DataColumn(
                                                      label: Text(viewModel
                                                                  .allPlayers[
                                                                      index]
                                                                  .player
                                                                  .nationality
                                                                  .length ==
                                                              19
                                                          ? viewModel
                                                              .allPlayers[index]
                                                              .player
                                                              .nationality
                                                              .substring(12)
                                                          : viewModel
                                                              .allPlayers[index]
                                                              .player
                                                              .nationality),
                                                    ),
                                                  ],
                                                  rows: <DataRow>[
                                                    DataRow(cells: <DataCell>[
                                                      DataCell(Text('Age')),
                                                      DataCell(Text(viewModel
                                                          .allPlayers[index]
                                                          .player
                                                          .age
                                                          .toString())),
                                                    ]),
                                                    DataRow(
                                                      cells: <DataCell>[
                                                        DataCell(
                                                            Text('Height')),
                                                        DataCell(
                                                          Text(
                                                            viewModel
                                                                .allPlayers[
                                                                    index]
                                                                .player
                                                                .height
                                                                .toString(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                visible.add(false);
                                return Container();
                              }
                            }),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
