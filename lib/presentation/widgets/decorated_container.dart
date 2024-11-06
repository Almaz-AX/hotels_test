import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  const DecoratedContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: child);
  }
}
