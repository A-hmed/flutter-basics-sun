import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_basics_c17_mon/ui/screens/game_board/xo_button.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_colors.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_styles.dart';
import 'package:flutter_basics_c17_mon/ui/widgets/gradient_scaffold.dart';

class GameBoard extends StatefulWidget {
  static const routeName = 'game_board';

  const GameBoard({super.key});

  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<String> board = ["", "", "", "", "", "", "", "", ""];

  int counter = 0;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });

  }


  late String firstPlayerSymbol;
  late String secondPlayerSymbol;

  @override
  Widget build(BuildContext context) {
    ///Inherited widget
    firstPlayerSymbol = ModalRoute.of(context)!.settings.arguments as String;
    secondPlayerSymbol = firstPlayerSymbol == "x" ? "o": "x";
    return GradientScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 24,
        ),
        buildTimer(),
        SizedBox(
          height: 24,
        ),
        buildPlayerTurnText(),
        SizedBox(
          height: 24,
        ),
        buildGameGrid(),
        SizedBox(
          height: 24,
        ),
      ],
    ));
  }

  buildTimer() => Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        padding: EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(44),
        ),
        child: Text(
          formatIntToTime(timer.tick),
          style: AppStyles.black32SemiBold,
          textAlign: TextAlign.center,
        ),
      );

  String formatIntToTime(int seconds) {
    int mins = seconds ~/ 60;
    int remainingSeconds = seconds - mins * 60;
    return "${mins < 10 ? "0$mins" : "$mins"}:"
        "${remainingSeconds < 10 ? "0$remainingSeconds" : "$remainingSeconds"}";
  }

  buildPlayerTurnText() => Text(
        "Player ${counter.isEven ? "1" : "2"}'s Turn",
        style: AppStyles.white36Bold,
        textAlign: TextAlign.center,
      );

  buildGameGrid() => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(44),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          XoButton(
                            symbol: board[0],
                            onClick: onPlayerClick,
                            buttonIndex: 0,
                          ),
                          XoButton(
                            symbol: board[1],
                            onClick: onPlayerClick,
                            buttonIndex: 1,
                          ),
                          XoButton(
                            symbol: board[2],
                            onClick: onPlayerClick,
                            buttonIndex: 2,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          XoButton(
                            symbol: board[3],
                            onClick: onPlayerClick,
                            buttonIndex: 3,
                          ),
                          XoButton(
                            symbol: board[4],
                            onClick: onPlayerClick,
                            buttonIndex: 4,
                          ),
                          XoButton(
                            symbol: board[5],
                            onClick: onPlayerClick,
                            buttonIndex: 5,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          XoButton(
                            symbol: board[6],
                            onClick: onPlayerClick,
                            buttonIndex: 6,
                          ),
                          XoButton(
                            symbol: board[7],
                            onClick: onPlayerClick,
                            buttonIndex: 7,
                          ),
                          XoButton(
                            symbol: board[8],
                            onClick: onPlayerClick,
                            buttonIndex: 8,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    VerticalDivider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );

  void onPlayerClick(int buttonIndex) {
    if (board[buttonIndex].isNotEmpty) return;
    board[buttonIndex] = counter.isEven ? firstPlayerSymbol : secondPlayerSymbol;

    if (checkWinner() || counter == 8) {
      clearBoard();
      return;
    }
    counter++;
    setState(() {});
  }

  void clearBoard() {
    board = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    setState(() {});
  }

  bool checkWinner() {
    var symbol = counter % 2 == 0 ? "o" : "x";

    ///Rows
    if (board[0] == symbol && board[1] == symbol && board[2] == symbol) {
      return true;
    }
    if (board[3] == symbol && board[4] == symbol && board[5] == symbol) {
      return true;
    }
    if (board[6] == symbol && board[7] == symbol && board[8] == symbol) {
      return true;
    }

    ///Columns
    if (board[0] == symbol && board[3] == symbol && board[6] == symbol) {
      return true;
    }
    if (board[1] == symbol && board[4] == symbol && board[7] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[5] == symbol && board[8] == symbol) {
      return true;
    }

    ///Diagonals
    if (board[0] == symbol && board[4] == symbol && board[8] == symbol) {
      return true;
    }
    if (board[2] == symbol && board[4] == symbol && board[6] == symbol) {
      return true;
    }
    return false;
  }
}
