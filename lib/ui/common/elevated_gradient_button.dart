import 'package:flutter/material.dart';

class ElevatedGradientButton extends StatelessWidget {
  final Widget? child;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Color? shadowColor;
  final BorderRadius? borderRadius;

  const ElevatedGradientButton({
    Key? key,
    required this.child,
    required this.gradient,
    required this.onPressed,
    this.shadowColor,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _shadowColor = shadowColor ?? Theme.of(context).shadowColor;
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: _shadowColor,
            offset: const Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
