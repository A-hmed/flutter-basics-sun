import 'package:flutter/material.dart';
import 'package:flutter_basics_c17_mon/ui/screens/game_board/game_board.dart';
import 'package:flutter_basics_c17_mon/ui/screens/xo_intro/xo_intro.dart';
/// Git Changes on your machine called Local changes
/// Git Changes on your Server(Github - GitLab - Azure - BitBucket) called Remote changes
/// Git is a command line tool
/// Git gui tools -> Ides(Android Studio - Vs code - intelij - Github desktop - GitKraken - Sourcetree)
///
/// Git commands ->
/// init: Create new empty git repository(local) -
/// add -
/// commit: Save your changes with message -
/// cherry pick: Move specific commit from one branch to another -
/// branch: Create new branch -
/// switch(checkout): Move between branches -
/// squash
/// reset (soft - hard): Remove one or more more commits from history
/// reverse: Undo changes made by a specific commit
/// merge: Combine changes from one branch into another(Move all commits)
/// rebase
/// pull
/// push
/// fetch
/// clone
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        GameBoard.routeName: (_) => const GameBoard(),
        XoIntro.routeName: (_) => XoIntro(),
      },
      initialRoute: XoIntro.routeName,
    );
  }
}

class Statless extends StatelessWidget {
  const Statless({super.key});

  @override
  Widget build(BuildContext context) {
    Text t = Text("2");
    Container c = Container(
      child: t,
      height: 200,
      width: 200,
    );
    return c;

    return Container(
      child: Text("213"),
      height: 200,
      width: 200,
    );
  }

}