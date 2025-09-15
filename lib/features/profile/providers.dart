import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Mock user provider
class UserNotifier extends StateNotifier<Map<String, String?>> {
  UserNotifier() : super({'name': 'John Doe', 'email': 'john@example.com'});

  void logout() {
    state = {'name': null, 'email': null};
  }
}

final userProvider = StateNotifierProvider<UserNotifier, Map<String, String?>>(
  (ref) => UserNotifier(),
);

/// Dark mode toggle provider
final darkModeProvider = StateProvider<bool>((ref) => false);
