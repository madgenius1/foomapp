import 'package:flutter/material.dart';

import '../../../../core/widgets/app_card.dart';

class SummaryCard extends StatelessWidget {
  final Duration dailyUsage;
  final int tokensEarned;

  const SummaryCard({
    super.key,
    required this.dailyUsage,
    required this.tokensEarned,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Today’s Usage", style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            "${dailyUsage.inHours}h ${dailyUsage.inMinutes.remainder(60)}m",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 12),
          Text("Tokens Earned: $tokensEarned"),
        ],
      ),
    );
  }
}
