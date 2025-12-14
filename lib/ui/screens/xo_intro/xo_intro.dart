import 'package:flutter/material.dart';
import 'package:flutter_basics_c17_mon/ui/screens/game_board/game_board.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_assets.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_colors.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_styles.dart';
import 'package:flutter_basics_c17_mon/ui/widgets/gradient_scaffold.dart';

class XoIntro extends StatelessWidget {
  static const routeName = 'xo_intro';

  const XoIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 8,
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.introBg),
                        fit: BoxFit.fill)),
                child: Center(
                    child: Text(
                  "Tic Tac Toe",
                  textAlign: TextAlign.center,
                  style: AppStyles.white40ThickBold,
                )))),
        Text(
          "Pick who goes first",
          style: AppStyles.white24Medium,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSymbolContainer(context, AppAssets.icX, "x"),
            buildSymbolContainer(context, AppAssets.icO, "o")
          ],
        ),
        SizedBox(
          height: 26,
        ),
      ],
    ));
  }

  Widget buildSymbolContainer(BuildContext context, String image, String symbol) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          GameBoard.routeName,
          arguments: [symbol, "", ""],
        );
      },
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32), color: AppColors.white),
        child: Image.asset(image),
      ),
    );
  }
}
