import 'package:flutter/material.dart';

class Pecularities extends StatelessWidget {
  const Pecularities({
    super.key,
    required this.pecularities,
  });

  final List<String> pecularities;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: pecularities
          .map((e) => Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              margin: const EdgeInsets.only(right: 8, bottom: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[300]),
              child: Text(e)))
          .toList(),
    );
  }
}