import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsageData {
  final List<Map<String, dynamic>> daily;
  final List<Map<String, dynamic>> weekly;

  UsageData({required this.daily, required this.weekly});
}

final usageProvider = Provider<UsageData>((ref) {
  final daily = [
    {'app': 'WhatsApp', 'minutes': 45},
    {'app': 'Instagram', 'minutes': 30},
    {'app': 'YouTube', 'minutes': 60},
    {'app': 'Chrome', 'minutes': 20},
  ];

  final weekly = [
    {'app': 'WhatsApp', 'minutes': 300},
    {'app': 'Instagram', 'minutes': 210},
    {'app': 'YouTube', 'minutes': 420},
    {'app': 'Chrome', 'minutes': 150},
  ];

  return UsageData(daily: daily, weekly: weekly);
});
