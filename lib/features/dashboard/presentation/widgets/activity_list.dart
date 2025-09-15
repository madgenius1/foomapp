import 'package:flutter/material.dart';

class ActivityList extends StatelessWidget {
  final List<String> activities;

  const ActivityList({super.key, required this.activities});

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return const Center(child: Text("No recent activity"));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Recent Activity", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...activities.map(
          (activity) => ListTile(
            leading: const Icon(Icons.check_circle_outline),
            title: Text(activity),
          ),
        ),
      ],
    );
  }
}
