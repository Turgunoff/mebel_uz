import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class InstallmentSection extends StatelessWidget {
  const InstallmentSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Рассрочка',
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Text(
                'Переплата 0%',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  height: 1,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 2.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Можна оформить на 6, 9, 12 и 24 месяца',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50.0)),
                child: const Icon(Iconsax.play_cricle),
              ),
              const SizedBox(width: 16.0),
              const Expanded(
                child: Text(
                  'Удобное оформление за 15 минут',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                    height: 1,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
