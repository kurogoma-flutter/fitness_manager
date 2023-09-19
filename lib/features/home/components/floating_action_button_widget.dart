import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../component/color/color_theme.dart';
import '../home_page_view_model.dart';

class FloatingActionButtonWidgets extends ConsumerWidget {
  const FloatingActionButtonWidgets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        FloatingActionButton(
          backgroundColor: ColorTheme.primaryOrange,
          heroTag: 'menu',
          onPressed: () {},
          child: const Icon(Icons.menu),
        ),
        const SizedBox(height: 16),
        FloatingActionButton(
          backgroundColor: ColorTheme.primaryOrange,
          heroTag: 'reload',
          onPressed: () {
            ref.read(homePageViewModelProvider.notifier).fetchDummyRecordList();
          },
          child: const Icon(Icons.replay_outlined),
        )
      ],
    );
  }
}
