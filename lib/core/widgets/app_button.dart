import 'package:flutter/material.dart';

enum AppButtonVariant { elevated, outlined, text }

class AppButton extends StatelessWidget {
  final String text; // 🔄 changed from `label`
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final AppButtonVariant variant;
  final bool fullWidth;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    Key? key,
    required this.text, // 🔄 changed from `label`
    this.onPressed,
    this.isLoading = false,
    this.icon,
    this.variant = AppButtonVariant.elevated,
    this.fullWidth = false,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.w600),
    );

    final content = isLoading
        ? SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(
                Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              textWidget,
            ],
          );

    final buttonChild = Padding(
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: content,
    );

    final commonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    );

    Widget button;
    switch (variant) {
      case AppButtonVariant.outlined:
        button = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Theme.of(context).colorScheme.primary),
            shape: commonShape,
          ),
          child: buttonChild,
        );
        break;
      case AppButtonVariant.text:
        button = TextButton(
          onPressed: isLoading ? null : onPressed,
          style: TextButton.styleFrom(shape: commonShape),
          child: buttonChild,
        );
        break;
      case AppButtonVariant.elevated:
      default:
        button = ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            shape: commonShape,
            elevation: 2,
            backgroundColor: Theme.of(context).colorScheme.primary,
            foregroundColor: Theme.of(context).colorScheme.onPrimary,
          ),
          child: buttonChild,
        );
    }

    if (fullWidth) {
      return SizedBox(width: double.infinity, child: button);
    }
    return button;
  }
}
