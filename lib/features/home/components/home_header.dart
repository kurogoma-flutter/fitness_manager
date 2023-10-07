import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../../../gen/assets.gen.dart';
import '../../component/color/color_theme.dart';
import '../../my_fitness/my_fitness_page.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () => AppRouter().pushNamed(
          context,
          MyFitnessPage.routeName,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 120,
                width: MediaQuery.sizeOf(context).width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Assets.images.gymBackground.image(
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Assets.images.myVideoIcon.image(
                      fit: BoxFit.fitWidth,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'MY FITNESS',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: ColorTheme.secondaryOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
