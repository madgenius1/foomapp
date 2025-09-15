import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'services/blocking_service.dart';
import 'services/firebase_service.dart';
import 'services/payment_service.dart';
// Services
import 'services/usage_service.dart';

// ----------------- SERVICES ----------------- //
final usageServiceProvider = Provider<UsageService>((ref) {
  return UsageService();
});

final blockingServiceProvider = Provider<BlockingService>((ref) {
  final service = BlockingService();
  ref.onDispose(service.dispose);
  return service;
});

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService();
});

final firebaseServiceProvider = Provider<FirebaseService>((ref) {
  return FirebaseService();
});

// ----------------- AUTH ----------------- //
final authStateProvider = StreamProvider.autoDispose((ref) {
  final firebase = ref.watch(firebaseServiceProvider);
  return firebase.authStateChanges();
});

// ----------------- DASHBOARD USAGE ----------------- //
final dailyUsageProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final usageService = ref.watch(usageServiceProvider);
  return usageService.getDailyUsage();
});

final weeklyUsageProvider = FutureProvider<List<Map<String, dynamic>>>((
  ref,
) async {
  final usageService = ref.watch(usageServiceProvider);
  return usageService.getWeeklyUsage();
});

// ----------------- BLOCKED APPS ----------------- //
final blockedAppsProvider = StreamProvider<Set<String>>((ref) {
  final blockingService = ref.watch(blockingServiceProvider);
  return blockingService.blockedAppsStream;
});

// ----------------- WALLET ----------------- //

// Token balance (simulated)
final walletBalanceProvider = StateProvider<double>((ref) => 0.0);

// Mock MMF selection
final selectedMmfProvider = StateProvider<String?>((ref) => null);

// Transaction history
final walletTransactionsProvider =
    StateNotifierProvider<
      WalletTransactionsNotifier,
      List<Map<String, dynamic>>
    >((ref) => WalletTransactionsNotifier());

class WalletTransactionsNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  WalletTransactionsNotifier() : super([]);

  void addTransaction(String type, double amount) {
    final transaction = {
      "type": type,
      "amount": amount,
      "timestamp": DateTime.now(),
    };
    state = [...state, transaction];
  }
}

// Deposit and Withdraw simulation
final walletActionsProvider = Provider<WalletActions>((ref) {
  final balance = ref.read(walletBalanceProvider.notifier);
  final txNotifier = ref.read(walletTransactionsProvider.notifier);

  return WalletActions(
    deposit: (double amount) {
      balance.state += amount;
      txNotifier.addTransaction("Deposit", amount);
    },
    withdraw: (double amount) {
      if (balance.state >= amount) {
        balance.state -= amount;
        txNotifier.addTransaction("Withdraw", amount);
      }
    },
  );
});

class WalletActions {
  final void Function(double amount) deposit;
  final void Function(double amount) withdraw;

  WalletActions({required this.deposit, required this.withdraw});
}
