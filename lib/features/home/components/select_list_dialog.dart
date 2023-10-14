import 'package:flutter/material.dart';

import '../../../core/constants/default_fitness_list.dart';
import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class SelectListDialog extends StatelessWidget {
  const SelectListDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: FractionallySizedBox(
        heightFactor: 0.5,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: ColorTheme.primaryCard,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'リストから選択',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: defaultFitnessList.length,
                    itemBuilder: (context, index) {
                      final item = defaultFitnessList[index];
                      return ListTile(
                        title: Text(
                          item,
                          style: TextStyle(
                            fontSize: 18,
                            color: ColorTheme.primaryText,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        onTap: () {
                          // 選択した値を返却する
                          AppRouter().popWithResult(context, item);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
