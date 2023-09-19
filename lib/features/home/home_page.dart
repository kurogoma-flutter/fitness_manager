import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/app_router.dart';
import '../component/color/color_theme.dart';
import '../component/text/middle_headline_text.dart';
import 'components/create_item_bottom_sheet.dart';
import 'components/floating_action_button_widget.dart';
import 'home_page_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  static const routePath = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(homePageViewModelProvider.notifier).fetchDummyRecordList();
        });

        return null;
      },
      [],
    );

    final state = ref.watch(homePageViewModelProvider);
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              state.recordList.isEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      sliver: SliverToBoxAdapter(
                        child: Center(
                          child: MiddleHeadlineText(
                            'レコードがありません',
                            textColor: ColorTheme.primaryBlack,
                          ),
                        ),
                      ),
                    )
                  : SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return Card(
                            color: ColorTheme.secondaryOrange,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 10,
                              ),
                              child: Text(
                                '${state.recordList[index].category} ${state.recordList[index].load} ${state.recordList[index].weightUnitType.name} x ${state.recordList[index].time} ${state.recordList[index].rmUnitType.name}',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                        childCount: state.recordList.length,
                      ),
                    ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverToBoxAdapter(
                  child: ElevatedButton(
                    onPressed: () async {
                      await AppRouter().showBottomSheet(
                        context,
                        const CreateItemBottomSheet(),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        ColorTheme.primaryOrange,
                      ),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 200),
              ),
            ],
          ),
          const Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButtonWidgets(),
          ),
        ],
      ),
    );
  }
}
