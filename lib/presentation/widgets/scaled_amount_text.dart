import 'package:flutter/material.dart';

/// Displays a formatted amount on one line, scaling text down when space is tight.
class ScaledAmountText extends StatelessWidget {
  const ScaledAmountText(
    this.text, {
    super.key,
    required this.style,
    this.alignment = Alignment.center,
    this.maxWidth,
    this.maxWidthFraction,
  });

  final String text;
  final TextStyle style;
  final Alignment alignment;
  final double? maxWidth;
  final double? maxWidthFraction;

  @override
  Widget build(BuildContext context) {
    final effectiveMaxWidth = maxWidth ??
        (maxWidthFraction != null
            ? MediaQuery.sizeOf(context).width * maxWidthFraction!
            : null);

    Widget child = FittedBox(
      fit: BoxFit.scaleDown,
      alignment: alignment,
      child: Text(
        text,
        maxLines: 1,
        softWrap: false,
        style: style,
      ),
    );

    if (effectiveMaxWidth != null) {
      child = ConstrainedBox(
        constraints: BoxConstraints(maxWidth: effectiveMaxWidth),
        child: child,
      );
    }

    return child;
  }
}
