import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/app_router.dart';
import '../../gen/assets.gen.dart';
import '../component/color/color_theme.dart';
import '../component/text/middle_headline_text.dart';
import 'components/create_item_bottom_sheet.dart';
import 'home_page_view_model.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  static const routePath = '/home';

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
      backgroundColor: ColorTheme.primaryBackGround,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 36),
                    child: SizedBox(
                      height: 160,
                      width: MediaQuery.sizeOf(context).width,
                      child: Assets.images.homeHeader.image(),
                    ),
                  ),
                ),
                state.recordList.isEmpty
                    ? SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        sliver: SliverToBoxAdapter(
                          child: Center(
                            child: MiddleHeadlineText(
                              'レコードがありません',
                              textColor: ColorTheme.primaryWhite,
                            ),
                          ),
                        ),
                      )
                    : SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: ColorTheme.primaryCard,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    top: 16,
                                    bottom: 16,
                                  ),
                                  child: Text(
                                    '${state.recordList[index].category} ${state.recordList[index].load}${state.recordList[index].weightUnitType.text} x ${state.recordList[index].time}${state.recordList[index].rmUnitType.text}',
                                    style: TextStyle(
                                      color: ColorTheme.primaryText,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            );
                          },
                          childCount: state.recordList.length,
                        ),
                      ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                          ColorTheme.primaryActive,
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
          ),
        ],
      ),
    );
  }
}
