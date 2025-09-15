import 'dart:async';

/// Service for getting screen time usage.
/// In real Android integration, use `usage_stats` plugin or
/// platform channels to access UsageStatsManager.
class UsageService {
  Future<List<Map<String, dynamic>>> getDailyUsage() async {
    // Mock daily usage data
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      {'app': 'WhatsApp', 'minutes': 45},
      {'app': 'Instagram', 'minutes': 30},
      {'app': 'YouTube', 'minutes': 60},
      {'app': 'Chrome', 'minutes': 20},
    ];
  }

  Future<List<Map<String, dynamic>>> getWeeklyUsage() async {
    // Mock weekly usage data
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      {'app': 'WhatsApp', 'minutes': 300},
      {'app': 'Instagram', 'minutes': 200},
      {'app': 'YouTube', 'minutes': 420},
      {'app': 'Chrome', 'minutes': 150},
      {'app': 'Twitter', 'minutes': 180},
    ];
  }
}
