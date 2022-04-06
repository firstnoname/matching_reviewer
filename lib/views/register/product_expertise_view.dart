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
          _buildFoodsOption(_character),
          _buildCosmeticsOption(_character),
          _buildClothes(_character),
          _buildServicesOption(_character),
        ],
      ),
    );
  }

  Row _buildFoodsOption(SingingCharacter _character) {
    return Row(
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
                      title: const Text('Fresh food'),
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
                      title: const Text('Processed food'),
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
    );
  }

  Row _buildCosmeticsOption(SingingCharacter _character) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('2. Cosmetics'),
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SingingCharacter>(
                          title: const Text('Hair cosmetics'),
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
                          title: const Text('Face cosmetics'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Body cosmetics'),
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
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SingingCharacter>(
                          title: const Text('Fragrances'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Miscellaneous cosmetics'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Other...'),
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
            ],
          ),
        ),
      ],
    );
  }

  Row _buildClothes(SingingCharacter _character) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('3. Clothes'),
              Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SingingCharacter>(
                          title: const Text('Shirt, Blouse, T-shirt, Jacket'),
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
                          title: const Text('Trousers, Pants'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Cap, Hat'),
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
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SingingCharacter>(
                          title: const Text('Scarf'),
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
                          title: const Text('Skirt'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Shoes, Boot, Sneaker'),
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
                  Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SingingCharacter>(
                          title: const Text('Belt'),
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
                          title: const Text('Accessory'),
                          value: SingingCharacter.jefferson,
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
                          title: const Text('Bag, Handbag, Purse'),
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
            ],
          ),
        ),
      ],
    );
  }

  Row _buildServicesOption(SingingCharacter _character) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('4. Services'),
              Row(
                children: [
                  Flexible(
                    child: RadioListTile<SingingCharacter>(
                      title: const Text('Accommodation (Hotel, Resort, Hostel, Homestay)'),
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
                      title: const Text('Tour'),
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
    );
  }
}
