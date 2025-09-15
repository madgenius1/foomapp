import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final String? label;

  const LoadingIndicator({Key? key, this.size = 28.0, this.label})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final indicator = SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: AlwaysStoppedAnimation(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );

    if (label == null) {
      return Center(child: indicator);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        indicator,
        SizedBox(width: 12),
        Text(label!, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
