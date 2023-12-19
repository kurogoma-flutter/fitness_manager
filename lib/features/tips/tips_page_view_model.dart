import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/logger/logger.dart';
import '../../core/model/tip_item/tip_item.dart';
import '../../local/local_tip_list.dart';
import 'tips_page_state.dart';

final tipPageViewModelProvider =
    StateNotifierProvider<TipPageViewModel, TipsPageState>(
  (ref) => TipPageViewModel(),
);

class TipPageViewModel extends StateNotifier<TipsPageState> {
  TipPageViewModel() : super(const TipsPageState());

  Future<void> fetchTipList({required int page}) async {
    state = state.copyWith(isLoading: true);
    try {
      final supabase = Supabase.instance.client;
      final response = await supabase
          .from('tips')
          .select()
          .range(20 * (page - 1) + 1, 20 * page);

      if (response.isEmpty) {
        state = state.copyWith(tipList: localTipList);
        return;
      }

      final tipList = response.map(TipItem.fromJson).toList();

      state = state.copyWith(tipList: [...state.tipList, ...tipList]);
      // ignore: avoid_catches_without_on_clauses
    } catch (e) {
      logger.e(e);
      state = state.copyWith(tipList: localTipList);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
