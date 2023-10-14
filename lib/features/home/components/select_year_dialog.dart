import 'package:flutter/material.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';

class SelectYearDialog extends StatelessWidget {
  const SelectYearDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    return Dialog(
      child: FractionallySizedBox(
        heightFactor: 0.35,
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
                  '対象年度',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: ColorTheme.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    AppRouter().popWithResult(
                      context,
                      (currentYear - 2),
                    );
                  },
                  child: Text(
                    (currentYear - 2).toString(),
                    style: TextStyle(
                      color: ColorTheme.primaryText,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AppRouter().popWithResult(
                      context,
                      (currentYear - 1),
                    );
                  },
                  child: Text(
                    (currentYear - 1).toString(),
                    style: TextStyle(
                      color: ColorTheme.primaryText,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    AppRouter().popWithResult(
                      context,
                      currentYear,
                    );
                  },
                  child: Text(
                    currentYear.toString(),
                    style: TextStyle(
                      color: ColorTheme.primaryText,
                      fontSize: 16,
                    ),
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
