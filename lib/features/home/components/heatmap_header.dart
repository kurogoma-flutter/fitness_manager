import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/color/color_theme.dart';
import '../home_page.dart';
import '../home_page_view_model.dart';
import 'select_year_dialog.dart';

class HeatMapHeader extends ConsumerWidget {
  const HeatMapHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ShowCaseItem(
            itemKey: four,
            containerMessage: '直近3年間のデータを切り替えることができます',
            child: TextButton(
              onPressed: () async {
                final result = await showDialog(
                  context: context,
                  builder: (context) => const SelectYearDialog(),
                );
                if (result == null) {
                  return;
                }
                ref
                    .read(homePageViewModelProvider.notifier)
                    .setTargetYear(result as int);
              },
              child: Text(
                ref.watch(homePageViewModelProvider).selectedYear.toString(),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: ColorTheme.primaryText,
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 2),
                width: 12,
                height: 12,
                color: ColorTheme.secondaryBackGround,
              ),
              Container(
                margin: const EdgeInsets.only(right: 2),
                width: 12,
                height: 12,
                color: ColorTheme.heatmap4,
              ),
              Container(
                margin: const EdgeInsets.only(right: 2),
                width: 12,
                height: 12,
                color: ColorTheme.heatmap3,
              ),
              Container(
                margin: const EdgeInsets.only(right: 2),
                width: 12,
                height: 12,
                color: ColorTheme.heatmap2,
              ),
              Container(
                margin: const EdgeInsets.only(right: 2),
                width: 12,
                height: 12,
                color: ColorTheme.heatmap1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
