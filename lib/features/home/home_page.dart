import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/color/color_theme.dart';
import '../component/text/middle_headline_text.dart';
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
      appBar: AppBar(
        backgroundColor: ColorTheme.primaryBlack,
        elevation: 4,
        title: const MiddleHeadlineText(
          'Fitness Record',
          textColor: Colors.white,
        ),
      ),
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
                                vertical: 8,
                              ),
                              child: Row(
                                children: [
                                  Text(state.recordList[index].category),
                                  const SizedBox(width: 4),
                                  Text(state.recordList[index].load.toString()),
                                  const SizedBox(width: 4),
                                  Text(
                                    state.recordList[index].weightUnitType.name,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text('x'),
                                  const SizedBox(width: 4),
                                  Text(state.recordList[index].time),
                                  const SizedBox(width: 4),
                                  Text(state.recordList[index].rmUnitType.name),
                                ],
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
                    onPressed: () {},
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
