import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../core/logger/logger.dart';
import '../../core/router/app_router.dart';
import '../component/color/color_theme.dart';
import '../component/text/middle_headline_text.dart';
import 'components/create_item_bottom_sheet.dart';
import 'components/edit_item_bottom_sheet.dart';
import 'components/heatmap.dart';
import 'components/home_header.dart';
import 'components/loading.dart';
import 'home_page_state.dart';
import 'home_page_view_model.dart';

final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();

class HomePage extends StatefulHookConsumerWidget {
  const HomePage({super.key});

  static const routeName = 'home';
  static const routePath = '/home';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void didChangeDependencies() {
    Future(() async {
      final notifier = ref.read(homePageViewModelProvider.notifier);
      await notifier.fetchRecordList();
      notifier.setTargetYear(null);
      await notifier.fetchHeatmapData();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homePageViewModelProvider);
    final notifier = ref.read(homePageViewModelProvider.notifier);

    return state.loading
        ? const Loading()
        : ShowCaseWidget(
            builder: Builder(
              builder: (context) => _HomePageView(state: state),
            ),
            disableBarrierInteraction: true,
            disableMovingAnimation: true,
            disableScaleAnimation: true,
            onFinish: () {
              logger.d('finish');
              notifier.setFirstLaunch();
            },
          );
  }
}

class _HomePageView extends ConsumerStatefulWidget {
  const _HomePageView({
    required this.state,
  });
  final HomePageState state;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => __HomePageViewState();
}

class __HomePageViewState extends ConsumerState<_HomePageView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ここで既読フラグ判定
      Future.delayed(const Duration(milliseconds: 0), () async {
        final firstLaunched =
            await ref.read(homePageViewModelProvider.notifier).isFirstLaunch();
        if (!firstLaunched) {
          return;
        }
        if (!mounted) {
          return;
        }
        ShowCaseWidget.of(context).startShowCase(
          [_one, _two, _three],
        );
      });
    });
    super.initState();
  }

  String _loadText(double load) {
    // loadが整数であれば小数点以下を削除
    if (load % 1 == 0) {
      return load.toInt().toString();
    }
    return load.toString();
  }

  @override
  Widget build(BuildContext context) {
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
                child: ShowCaseItem(
                  itemKey: _three,
                  containerMessage:
                      'あなたのコミットログはこちらから確認できます！\nコミット量に応じて色が濃くなります！',
                  containerAlignment: CrossAxisAlignment.end,
                  child: Row(
                    children: [
                      Expanded(
                        child: Heatmap(
                          data: widget.state.heatmapData,
                          colorSet: {
                            1: ColorTheme.heatmap4,
                            2: ColorTheme.heatmap3,
                            3: ColorTheme.heatmap2,
                            4: ColorTheme.heatmap2,
                            5: ColorTheme.heatmap1,
                          },
                          cellSize: 16,
                          defaultColor: ColorTheme.secondaryCard,
                          targetYear: widget.state.selectedYear,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ShowCaseItem(
                  itemKey: _two,
                  containerMessage:
                      'あなたがトレーニング中に視聴するお気に入り動画を\nMy Fitnessに登録しましょう！',
                  containerAlignment: CrossAxisAlignment.end,
                  child: const HomeHeader(),
                ),
              ),
              widget.state.recordList.isEmpty
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
                          final record = widget.state.recordList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: GestureDetector(
                              onTap: () async {
                                await AppRouter().showBottomSheet(
                                  context,
                                  EditItemBottomSheet(
                                    record: record,
                                  ),
                                );
                              },
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
                                    '${record.category} ${_loadText(record.load)}${record.weightUnitType.text} x ${record.time}${record.rmUnitType.text}',
                                    style: TextStyle(
                                      color: ColorTheme.primaryText,
                                      fontSize: 15,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        childCount: widget.state.recordList.length,
                      ),
                    ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: SliverToBoxAdapter(
                  child: ShowCaseItem(
                    itemKey: _one,
                    containerMessage:
                        'こちらから、あなたの記録を登録していきましょう！\nコツコツベストを更新できるよう応援します',
                    containerAlignment: CrossAxisAlignment.end,
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

class ShowCaseItem extends StatelessWidget {
  const ShowCaseItem({
    required this.itemKey,
    required this.containerMessage,
    required this.child,
    super.key,
    this.position = TooltipPosition.bottom,
    this.height = 300,
    this.width = 200,
    this.containerAlignment = CrossAxisAlignment.start,
    this.containerPadding = const EdgeInsets.symmetric(vertical: 16),
  });

  final GlobalKey itemKey;

  final String containerMessage;
  final Widget child;
  final double height;
  final double width;
  final CrossAxisAlignment containerAlignment;
  final EdgeInsets containerPadding;

  final TooltipPosition position;

  @override
  Widget build(BuildContext context) {
    return Showcase.withWidget(
      key: itemKey,
      height: height,
      width: width,
      targetPadding: const EdgeInsets.all(4),
      targetBorderRadius: const BorderRadius.all(Radius.circular(16)),
      tooltipPosition: position,
      container: SizedBox(
        child: Padding(
          padding: containerPadding,
          child: Column(
            crossAxisAlignment: containerAlignment,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Text(
                  containerMessage,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ShowCaseWidget.of(context).next();
                },
                child: const Text('次へ'),
              ),
            ],
          ),
        ),
      ),
      disableMovingAnimation: true,
      child: child,
    );
  }
}
