import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers.dart';
import 'widgets/activity_list.dart';
import 'widgets/progress_bar.dart';
import 'widgets/summary_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("FOOM Dashboard"),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.go('/dashboard/profile'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(dashboardProvider.notifier).loadDashboard();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SummaryCard(
              dailyUsage: dashboardState.dailyUsage,
              tokensEarned: dashboardState.tokensEarned,
            ),
            const SizedBox(height: 16),
            const ProgressBar(),
            const SizedBox(height: 16),
            ActivityList(activities: dashboardState.recentActivities),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: dashboardState.navIndex,
        onDestinationSelected: (index) {
          ref.read(dashboardProvider.notifier).setNavIndex(index);
          switch (index) {
            case 0:
              context.go('/dashboard');
              break;
            case 1:
              context.go('/dashboard/apps');
              break;
            case 2:
              context.go('/dashboard/insights');
              break;
            case 3:
              context.go('/dashboard/wallet');
              break;
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: "Home"),
          NavigationDestination(icon: Icon(Icons.block), label: "Apps"),
          NavigationDestination(icon: Icon(Icons.bar_chart), label: "Insights"),
          NavigationDestination(
            icon: Icon(Icons.account_balance),
            label: "Wallet",
          ),
        ],
      ),
    );
  }
}
