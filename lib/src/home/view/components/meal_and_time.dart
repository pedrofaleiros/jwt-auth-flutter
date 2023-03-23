import 'package:flutter/material.dart';

class NameAndTime extends StatelessWidget {
  const NameAndTime({
    super.key,
    required this.name,
    required this.hour,
    required this.minutes,
  });

  final String name;
  final int hour;
  final int minutes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: _style.copyWith(fontSize: 18),
        ),
        Row(
          children: [
            minutes == 0
                ? Text(
                    '${hour.toString()}:${minutes.toString()}0',
                    style: _style,
                  )
                : Text(
                    '${hour.toString()}:${minutes.toString()}',
                    style: _style,
                  ),
            const SizedBox(width: 5),
            const Icon(Icons.access_time),
          ],
        )
      ],
    );
  }

  TextStyle get _style => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );
}
