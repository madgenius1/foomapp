import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double elevation;
  final ShapeBorder? shape;

  const AppCard({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.margin = const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
    this.elevation = 0.5,
    this.shape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resolvedShape =
        shape ??
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

    return Container(
      margin: margin,
      child: Card(
        elevation: elevation,
        shape: resolvedShape,
        color: Theme.of(context).colorScheme.surface,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
