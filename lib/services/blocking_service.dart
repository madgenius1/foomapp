import 'dart:async';

/// Service for blocking apps using overlay or AccessibilityService.
/// For MVP, we simulate blocking only.
class BlockingService {
  final _blockedApps = <String>{};
  final _controller = StreamController<Set<String>>.broadcast();

  Stream<Set<String>> get blockedAppsStream => _controller.stream;

  void toggleAppBlock(String app) {
    if (_blockedApps.contains(app)) {
      _blockedApps.remove(app);
    } else {
      _blockedApps.add(app);
    }
    _controller.add(_blockedApps);
  }

  bool isBlocked(String app) => _blockedApps.contains(app);

  void dispose() {
    _controller.close();
  }
}
