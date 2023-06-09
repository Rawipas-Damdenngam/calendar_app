import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calendar_app/data/dummy_account.dart';
import 'package:calendar_app/models/account.dart';

class AccountsNotifier extends StateNotifier<List<Account>> {
  AccountsNotifier() : super(dummyAccounts);

  void swapAccounts() {
    if (state.length < 2) {
      return; // Return early if there are less than 2 accounts
    }

    final firstAccount = state[0];
    final secondAccount = state[1];

    state = [
      secondAccount.copyWith(isSelected: firstAccount.isSelected),
      firstAccount.copyWith(isSelected: secondAccount.isSelected),
      ...state.sublist(2),
    ];
  }
}

final accountsProvider = StateNotifierProvider<AccountsNotifier, List<Account>>(
  (ref) => AccountsNotifier(),
);
