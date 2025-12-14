import 'package:flutter/material.dart';
import 'package:flutter_basics_c17_mon/ui/utils/app_assets.dart';

class XoButton extends StatelessWidget {
  final String symbol;
  final  Function onClick;
  final int buttonIndex;
  const XoButton({super.key, required this.symbol,
    required this.onClick, required this.buttonIndex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: (){
          onClick(buttonIndex);
        },
        child: Container(
          child: symbol.isEmpty
              ? SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                )
              : Image.asset(symbol == "x" ? AppAssets.icX : AppAssets.icO),
        ),
      ),
    );
  }
}
