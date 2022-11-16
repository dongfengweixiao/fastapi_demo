import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
    this.colors,
    this.onTap,
    this.width,
    this.height,
    required this.borderRadius,
    required this.child,
  });

  final List<Color>? colors;

  final VoidCallback? onTap;

  final double? width;
  final double? height;

  final double borderRadius;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors = colors ??
        [
          theme.primaryColor,
          theme.primaryColorDark,
        ];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _colors,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: width,
              height: height,
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
