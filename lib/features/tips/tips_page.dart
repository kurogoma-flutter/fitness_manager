import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../component/color/color_theme.dart';
import 'tips_page_view_model.dart';

class TipsPage extends StatefulHookConsumerWidget {
  const TipsPage({super.key});

  static const routeName = 'tips';
  static const routePath = '/tips';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TipsPageState();
}

class _TipsPageState extends ConsumerState<TipsPage> {
  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(tipPageViewModelProvider.notifier).fetchTipList();
        });
        return null;
      },
      [],
    );

    final state = ref.watch(tipPageViewModelProvider);

    return Scaffold(
      backgroundColor: ColorTheme.primaryBackGround,
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemCount: state.tipList.length,
            itemBuilder: (context, index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorTheme.primaryCard,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: ColorTheme.secondaryCard,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: SizedBox(
                        height: 120,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Image.network(
                            state.tipList[index].thumbnailUrl,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        state.tipList[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          color: ColorTheme.primaryText,
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
