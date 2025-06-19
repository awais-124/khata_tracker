import 'package:flutter/material.dart';

enum ButtonVariant { filled, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;
  final ButtonVariant variant;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.variant = ButtonVariant.filled,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color? bgColor = backgroundColor;
    Color? txtColor = textColor;
    Color? brdColor = borderColor;

    if (variant == ButtonVariant.filled) {
      bgColor ??= theme.primaryColor;
      txtColor ??= theme.colorScheme.onPrimary;
    } else if (variant == ButtonVariant.outlined) {
      bgColor = Colors.transparent;
      txtColor ??= theme.primaryColor;
      brdColor ??= theme.primaryColor;
    } else {
      bgColor = Colors.transparent;
      txtColor ??= theme.primaryColor;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: txtColor,
        side: brdColor != null ? BorderSide(color: brdColor) : null,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: variant == ButtonVariant.filled ? 2 : 0,
      ),
      onPressed: isLoading ? null : onPressed,
      child:
          isLoading
              ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
              : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) Icon(icon, size: 20),
                  if (icon != null) const SizedBox(width: 8),
                  Text(text),
                ],
              ),
    );
  }
}
