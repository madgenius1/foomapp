import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'widgets/balance_card.dart';
import 'widgets/mmf_list.dart';
import 'widgets/transaction_list.dart';

class WalletScreen extends ConsumerWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(balanceProvider);
    final transactions = ref.watch(transactionsProvider);
    final selectedMmf = ref.watch(selectedMmfProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Wallet')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BalanceCard(balance: balance),
            const SizedBox(height: 16),
            ExpansionTile(
              title: const Text('Select MMF'),
              children: [
                MmfList(
                  selectedMmf: selectedMmf,
                  onSelect: (mmf) {
                    ref.read(selectedMmfProvider.notifier).state = mmf;
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            OutlinedButton(
              onPressed: () {
                // simulate adding funds
                ref
                    .read(transactionsProvider.notifier)
                    .addTransaction('Deposit', 500);
                ref.read(balanceProvider.notifier).state += 500;
              },
              child: const Text('Add Funds'),
            ),
            const SizedBox(height: 24),
            TransactionList(transactions: transactions),
          ],
        ),
      ),
    );
  }
}
