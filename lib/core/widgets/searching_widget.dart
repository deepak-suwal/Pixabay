import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_widget/styled_widget.dart';

class SearchingWidget extends StatelessWidget {
  const SearchingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/searching_animation.json',
      height: 160,
      width: 160,
    ).center();
  }
}
