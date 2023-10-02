import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../demo/dummy_tip_list.dart';
import 'tips_page_state.dart';

final tipPageViewModelProvider =
    StateNotifierProvider<TipPageViewModel, TipsPageState>(
  (ref) => TipPageViewModel(),
);

class TipPageViewModel extends StateNotifier<TipsPageState> {
  TipPageViewModel() : super(const TipsPageState());

  Future<void> fetchTipList() async {
    final tipList = dummyTipList;
    state = state.copyWith(tipList: tipList);
  }
}
