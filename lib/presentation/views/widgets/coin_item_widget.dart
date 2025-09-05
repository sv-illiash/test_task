import 'package:flutter/material.dart';
import 'package:test_task/domain/entities/coin_entity.dart';

class CoinItemWidget extends StatelessWidget {
  final CoinEntity crypto;
  final int index;

  const CoinItemWidget({super.key, required this.crypto, required this.index});

  Color _randomColor(int index) {
    final hash = crypto.name.hashCode ^ index;
    final colorValue = (hash * 2654435761) % 0xFFFFFF;
    return Color(0xFF000000 | colorValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: _randomColor(index),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              crypto.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
         // const Spacer(),
          Text(
            "\$${crypto.priceUsd.toStringAsFixed(2)}",
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
