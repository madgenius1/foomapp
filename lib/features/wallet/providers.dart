import 'package:flutter_riverpod/flutter_riverpod.dart';

// Balance provider
final balanceProvider = StateProvider<int>((ref) => 1000); // starting balance

// Selected MMF provider
final selectedMmfProvider = StateProvider<String?>((ref) => null);

// Transactions provider
class TransactionsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  TransactionsNotifier() : super([]);

  void addTransaction(String type, int amount) {
    state = [
      ...state,
      {'type': type, 'amount': amount, 'date': DateTime.now()},
    ];
  }
}

final transactionsProvider =
    StateNotifierProvider<TransactionsNotifier, List<Map<String, dynamic>>>(
      (ref) => TransactionsNotifier(),
    );
