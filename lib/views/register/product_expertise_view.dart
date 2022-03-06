import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }

class ProductExpertiseView extends StatelessWidget {
  const ProductExpertiseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SingingCharacter? _character = SingingCharacter.lafayette;
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Expertise'),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1. Food'),
                    Row(
                      children: [
                        Flexible(
                          child: RadioListTile<SingingCharacter>(
                            title: const Text('Lafayette'),
                            value: SingingCharacter.lafayette,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              // setState(() {
                              //   _character = value;
                              // });
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<SingingCharacter>(
                            title: const Text('Lafayette'),
                            value: SingingCharacter.jefferson,
                            groupValue: _character,
                            onChanged: (SingingCharacter? value) {
                              // setState(() {
                              //   _character = value;
                              // });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
