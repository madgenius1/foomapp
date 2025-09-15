import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardState {
  final Duration dailyUsage;
  final int tokensEarned;
  final List<String> recentActivities;
  final int navIndex;

  const DashboardState({
    this.dailyUsage = const Duration(hours: 1, minutes: 30),
    this.tokensEarned = 10,
    this.recentActivities = const [],
    this.navIndex = 0,
  });

  DashboardState copyWith({
    Duration? dailyUsage,
    int? tokensEarned,
    List<String>? recentActivities,
    int? navIndex,
  }) {
    return DashboardState(
      dailyUsage: dailyUsage ?? this.dailyUsage,
      tokensEarned: tokensEarned ?? this.tokensEarned,
      recentActivities: recentActivities ?? this.recentActivities,
      navIndex: navIndex ?? this.navIndex,
    );
  }
}

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier() : super(const DashboardState());

  void loadDashboard() {
    // Mock logic
    state = state.copyWith(
      dailyUsage: const Duration(hours: 2, minutes: 15),
      tokensEarned: 15,
      recentActivities: [
        "Blocked Instagram for 1 hour",
        "Tracked 30 minutes on WhatsApp",
        "Earned 5 tokens",
      ],
    );
  }

  void setNavIndex(int index) {
    state = state.copyWith(navIndex: index);
  }
}

final dashboardProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
      (ref) => DashboardNotifier(),
    );
