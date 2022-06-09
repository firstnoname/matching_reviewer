import 'package:flutter/material.dart';
import 'package:matching_reviewer/widgets/widgets.dart';

class SelectableCategory extends StatelessWidget {
  final Function onSelectCategory;

  const SelectableCategory({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => onSelectCategory('food', 'fresh_food'),
                child: const ChipGenerator(
                    label: 'Fresh food', color: Color(0xFFff6666))),
            GestureDetector(
              onTap: () => onSelectCategory('food', 'processed_food'),
              child: const ChipGenerator(
                  label: 'Process food', color: Color(0xFFff6666)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () => onSelectCategory('cosmetic', 'hair_cosmetic'),
                child: const ChipGenerator(
                    label: 'Hair cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => onSelectCategory('cosmetic', 'face_cosmetic'),
                child: const ChipGenerator(
                    label: 'Face cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => onSelectCategory('cosmetic', 'body_cosmetic'),
                child: const ChipGenerator(
                    label: 'Body cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => onSelectCategory('cosmetic', 'fragrances'),
                child: const ChipGenerator(
                    label: 'Fragrances', color: Color(0xFF007f5c))),
            GestureDetector(
              onTap: () =>
                  onSelectCategory('cosmetic', 'miscellaneous_cosmetic'),
              child: const ChipGenerator(
                  label: 'Miscellaneous cosmetics', color: Color(0xFF007f5c)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => onSelectCategory('cloth', 'shirt'),
              child: const ChipGenerator(
                  label: 'Shirt, Blouse, T-shirt, Jacket',
                  color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'trouser'),
                child: const ChipGenerator(
                    label: 'Trousers, Pants', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'cap'),
                child: const ChipGenerator(
                    label: 'Cap, Hat', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'scarf'),
                child: const ChipGenerator(
                    label: 'Scarf', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'skirt'),
                child: const ChipGenerator(
                    label: 'Skirt', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => onSelectCategory('cloth', 'shoes'),
              child: const ChipGenerator(
                  label: 'Shoes, Boot, Sneaker', color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'belt'),
                child: const ChipGenerator(
                    label: 'Belt', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => onSelectCategory('cloth', 'accessory'),
                child: const ChipGenerator(
                    label: 'Accessory', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => onSelectCategory('cloth', 'bag'),
              child: const ChipGenerator(
                  label: 'Bag, Handbag, Purse', color: Color(0xFF5f65d3)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => onSelectCategory('services', 'accommodation'),
              child: const ChipGenerator(
                  label: 'Accommodation(Hotel, Resort, Hostel)',
                  color: Color(0xFF19ca21)),
            ),
            GestureDetector(
                onTap: () => onSelectCategory('services', 'tour'),
                child: const ChipGenerator(
                    label: 'tour', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => onSelectCategory('services', 'restaurant'),
                child: const ChipGenerator(
                    label: 'Restaurants', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => onSelectCategory('services', 'cafe'),
                child: const ChipGenerator(
                    label: 'Cafe', color: Color(0xFF19ca21)))
          ],
        ),
      ],
    );
  }
}
