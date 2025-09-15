import 'package:flutter/material.dart';

class UsageList extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const UsageList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data.map((appData) {
        final appName = appData['app'] as String;
        final minutes = appData['minutes'] as int;
        return ListTile(
          leading: const Icon(Icons.apps),
          title: Text(appName),
          trailing: Text('$minutes min'),
        );
      }).toList(),
    );
  }
}
