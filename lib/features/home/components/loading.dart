import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../../component/color/color_theme.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      body: Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: Assets.images.loadingLipple.image(),
        ),
      ),
    );
  }
}
