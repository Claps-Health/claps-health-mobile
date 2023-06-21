import 'package:flutter/material.dart';

class PainSlider extends StatelessWidget {
  const PainSlider({super.key, required this.painLevel, this.onSliderChangeFn});

  final double painLevel;
  final void Function(double value)? onSliderChangeFn;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: painLevel,
      min: 1,
      max: 10,
      activeColor: const Color(0xFFf67e7b),
      inactiveColor: const Color(0xFFe5e5e5),
      thumbColor: const Color(0xFF456d92),
      onChanged: onSliderChangeFn,
    );
  }
}
