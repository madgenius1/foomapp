import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock list of installed apps (replace with package_manager plugin in real case)
final appsProvider = Provider<List<String>>((ref) {
  return [
    "Instagram",
    "TikTok",
    "YouTube",
    "Facebook",
    "Twitter",
    "Reddit",
    "WhatsApp",
  ];
});

/// Holds the blocked apps list
final blockedAppsProvider =
    StateNotifierProvider<BlockedAppsNotifier, List<String>>((ref) {
      return BlockedAppsNotifier();
    });

class BlockedAppsNotifier extends StateNotifier<List<String>> {
  BlockedAppsNotifier() : super([]);

  void toggleApp(String app) {
    if (state.contains(app)) {
      state = state.where((a) => a != app).toList();
    } else {
      state = [...state, app];
    }
  }
}
