import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        title: const MiddleHeadlineText(
          'Fitness Record',
          textColor: Colors.black,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          state.recordList.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: MiddleHeadlineText('レコードがありません'),
                  ),
                )
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Card(
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
                              Text(state.recordList[index].load.toString()),
                              Text(state.recordList[index].weightUnitType.name),
                              const Text(' x '),
                              Text(state.recordList[index].time),
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
              child: IconButton.filledTonal(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
