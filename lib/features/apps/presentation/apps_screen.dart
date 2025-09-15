import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';
import 'blocked_overlay.dart';
import 'widgets/app_tile.dart';

class AppsScreen extends ConsumerWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apps = ref.watch(appsProvider);
    final blockedApps = ref.watch(blockedAppsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('App Management')),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final app = apps[index];
              final isBlocked = blockedApps.contains(app);

              return AppTile(
                appName: app,
                isBlocked: isBlocked,
                onToggle: () {
                  ref.read(blockedAppsProvider.notifier).toggleApp(app);
                },
              );
            },
          ),
          if (blockedApps.isNotEmpty) const BlockedOverlay(),
        ],
      ),
    );
  }
}
