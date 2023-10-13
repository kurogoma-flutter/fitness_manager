import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../component/color/color_theme.dart';
import '../setting_page_view_model.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage({super.key});

  static const String routeName = 'about_this_app';
  static const String routePath = 'about_this_app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingPageViewModelProvider);
    useEffect(
      () {
        Future(() async {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            await ref
                .read(settingPageViewModelProvider.notifier)
                .fetchAppVersion();
          });
        });
        return null;
      },
      const [],
    );

    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28),
          onPressed: () {
            AppRouter().pop(context);
          },
          color: ColorTheme.primaryIcon,
        ),
        title: Text(
          'このアプリについて',
          style: TextStyle(
            color: ColorTheme.primaryText,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ColorTheme.primaryBackGround,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _LabelTextWithValue(
                label: 'アプリ名',
                value: 'Track Peak',
              ),
              _LabelTextWithValue(
                label: 'アプリバージョン',
                value: state.appVersion,
              ),
              const _LabelTextWithValue(
                label: '製作者',
                value: 'Kurogoma939',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabelTextWithValue extends StatelessWidget {
  const _LabelTextWithValue({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: ColorTheme.primaryText,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: ColorTheme.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
