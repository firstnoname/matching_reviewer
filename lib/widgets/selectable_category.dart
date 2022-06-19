import 'package:flutter/material.dart';
import 'package:matching_reviewer/widgets/widgets.dart';

class SelectableCategory extends StatefulWidget {
  final Function onSelectCategory;

  const SelectableCategory({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  State<SelectableCategory> createState() => _SelectableCategoryState();
}

class _SelectableCategoryState extends State<SelectableCategory> {
  final Map<String, dynamic> _categories = {
    'food': [
      {'fresh_food': 'Fresh food'},
      {'processed_food': 'Processed food'}
    ],
    'cosmetic': [
      {'hair_cosmetic': 'Hair cosmetics'},
      {'face_cosmetic': 'Face cosmetics'},
      {'body_cosmetic': 'Body cosmetics'},
      {'fragrances': 'Fragrances'},
      {'miscellaneous_cosmetic': 'Miscellaneous cosmetics'}
    ],
    'cloth': [
      {'shirt': 'Shirt, Blouse, T-shirt, Jacket'},
      {'trouser': 'Trousers, Pants'},
      {'cap': 'Cap, Hat'},
      {'scarf': 'Scarf'},
      {'skirt': 'Skirt'},
      {'shoes': 'Shoes, Boot, Sneaker'},
      {'belt': 'belt'},
      {'accessory': 'Accessory'},
      {'bag': 'Bag'},
    ],
    'services': [
      {'accommodation': 'Accommodation(Hotel, Resort, Hostel)'},
      {'tour': 'Tour'},
      {'restaurant': 'Restaurant'},
      {'cafe': 'Cafe'}
    ],
  };

  String selectedSubCategory = '';

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _categories.entries
            .map((category) => Row(
                  children: (category.value as List).map((subCategory) {
                    Color _chipColor =
                        getColorFromCategoryType(type: category.key);

                    return GestureDetector(
                      onTap: () {
                        widget.onSelectCategory(
                            category.key, (subCategory as Map).keys.first);
                        setState(() {
                          selectedSubCategory = subCategory.keys.first;
                        });
                      },
                      child: ChipGenerator(
                        label: (subCategory as Map).values.first,
                        color: _chipColor,
                        isSelected:
                            selectedSubCategory == subCategory.keys.first,
                        // isSelected: ,
                      ),
                    );
                  }).toList(),
                ))
            .toList());
  }

  Color getColorFromCategoryType({required String type}) {
    Color _color;
    switch (type) {
      case 'food':
        _color = const Color(0xFFff6666);
        break;
      case 'cosmetic':
        _color = const Color(0xFF007f5c);
        break;
      case 'cloth':
        _color = const Color(0xFF5f65d3);
        break;
      default:
        _color = const Color(0xFF19ca21);
        break;
    }
    return _color;
  }

  Widget buildStaticChip() {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => widget.onSelectCategory('food', 'fresh_food'),
                child: const ChipGenerator(
                    label: 'Fresh food', color: Color(0xFFff6666))),
            GestureDetector(
              onTap: () => widget.onSelectCategory('food', 'processed_food'),
              child: const ChipGenerator(
                  label: 'Process food', color: Color(0xFFff6666)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () =>
                    widget.onSelectCategory('cosmetic', 'hair_cosmetic'),
                child: const ChipGenerator(
                    label: 'Hair cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () =>
                    widget.onSelectCategory('cosmetic', 'face_cosmetic'),
                child: const ChipGenerator(
                    label: 'Face cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () =>
                    widget.onSelectCategory('cosmetic', 'body_cosmetic'),
                child: const ChipGenerator(
                    label: 'Body cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cosmetic', 'fragrances'),
                child: const ChipGenerator(
                    label: 'Fragrances', color: Color(0xFF007f5c))),
            GestureDetector(
              onTap: () =>
                  widget.onSelectCategory('cosmetic', 'miscellaneous_cosmetic'),
              child: const ChipGenerator(
                  label: 'Miscellaneous cosmetics', color: Color(0xFF007f5c)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => widget.onSelectCategory('cloth', 'shirt'),
              child: const ChipGenerator(
                  label: 'Shirt, Blouse, T-shirt, Jacket',
                  color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'trouser'),
                child: const ChipGenerator(
                    label: 'Trousers, Pants', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'cap'),
                child: const ChipGenerator(
                    label: 'Cap, Hat', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'scarf'),
                child: const ChipGenerator(
                    label: 'Scarf', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'skirt'),
                child: const ChipGenerator(
                    label: 'Skirt', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => widget.onSelectCategory('cloth', 'shoes'),
              child: const ChipGenerator(
                  label: 'Shoes, Boot, Sneaker', color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'belt'),
                child: const ChipGenerator(
                    label: 'Belt', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('cloth', 'accessory'),
                child: const ChipGenerator(
                    label: 'Accessory', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => widget.onSelectCategory('cloth', 'bag'),
              child: const ChipGenerator(
                  label: 'Bag, Handbag, Purse', color: Color(0xFF5f65d3)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => widget.onSelectCategory('services', 'accommodation'),
              child: const ChipGenerator(
                  label: 'Accommodation(Hotel, Resort, Hostel)',
                  color: Color(0xFF19ca21)),
            ),
            GestureDetector(
                onTap: () => widget.onSelectCategory('services', 'tour'),
                child: const ChipGenerator(
                    label: 'Tour', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('services', 'restaurant'),
                child: const ChipGenerator(
                    label: 'Restaurants', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => widget.onSelectCategory('services', 'cafe'),
                child: const ChipGenerator(
                    label: 'Cafe', color: Color(0xFF19ca21)))
          ],
        ),
      ],
    );
  }
}
