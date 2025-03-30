import 'package:flutter/material.dart';

class DefaultCommonButton extends StatelessWidget {
  const DefaultCommonButton({
    super.key,
    required this.child,
    this.onPressed,
    this.size = 64,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(child: child),
      ),
    );
  }
}
