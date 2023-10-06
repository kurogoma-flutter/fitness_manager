import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/router/app_router.dart';
import '../component/color/color_theme.dart';
import '../component/text/middle_headline_text.dart';
import 'components/create_item_bottom_sheet.dart';
import 'components/heatmap.dart';
import 'components/home_header.dart';
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
          ref.read(homePageViewModelProvider.notifier).fetchHeatmapData();
          ref.read(homePageViewModelProvider.notifier).setTargetYear(null);
        });

        return null;
      },
      [],
    );

    final state = ref.watch(homePageViewModelProvider);
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorTheme.primaryBackGround,
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () async {},
                      child: Text(
                        '2023',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.primaryText,
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
              ),
              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: Heatmap(
                        data: state.heatmapData,
                        colorSet: {
                          1: ColorTheme.heatmap4,
                          2: ColorTheme.heatmap3,
                          3: ColorTheme.heatmap2,
                          4: ColorTheme.heatmap2,
                          5: ColorTheme.heatmap1,
                        },
                        cellSize: 16,
                        defaultColor: ColorTheme.secondaryCard,
                        targetYear: state.selectedYear,
                      ),
                    ),
                  ],
                ),
              ),
              const HomeHeader(),
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
      ),
    );
  }
}
