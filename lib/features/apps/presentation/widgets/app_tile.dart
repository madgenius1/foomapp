import 'package:flutter/material.dart';

class AppTile extends StatelessWidget {
  final String appName;
  final bool isBlocked;
  final VoidCallback onToggle;

  const AppTile({
    super.key,
    required this.appName,
    required this.isBlocked,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isBlocked ? Icons.block : Icons.apps,
        color: isBlocked ? Colors.red : Colors.blue,
      ),
      title: Text(appName),
      trailing: Switch(value: isBlocked, onChanged: (_) => onToggle()),
    );
  }
}
