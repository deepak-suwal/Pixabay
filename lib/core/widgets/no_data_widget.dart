import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_widget/styled_widget.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/no_data_animation.json',
      height: 160,
      width: 160,
    ).center();
  }
}
