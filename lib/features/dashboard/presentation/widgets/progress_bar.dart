import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Weekly Goal Progress",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        const LinearProgressIndicator(
          value: 0.6, // mock value for now
          minHeight: 10,
          backgroundColor: Colors.grey,
          color: Colors.deepPurple,
        ),
        const SizedBox(height: 4),
        const Text("60% of weekly goal achieved"),
      ],
    );
  }
}
