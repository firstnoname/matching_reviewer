import 'package:flutter/material.dart';

enum SingingCharacter { lafayette, jefferson }
enum Food { fresh, processed }
enum Cosmetic { hair, face, body, fragrance, miscellaneous, other }
enum Cloth { shirt, trouser, hat, scarf, skirt, shoes, belt, accessory, bag }
enum Service { accommodation, tour, restaurant, cafe }

class ProductExpertiseView extends StatelessWidget {
  ProductExpertiseView({Key? key}) : super(key: key);

  final ValueNotifier<Food> _initFood = ValueNotifier(Food.fresh);
  final ValueNotifier<Cosmetic> _initCosmetic = ValueNotifier(Cosmetic.hair);
  final ValueNotifier<Cloth> _initCloth = ValueNotifier(Cloth.shirt);
  final ValueNotifier<Service> _initService = ValueNotifier(Service.accommodation);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Product Expertise'),
          _buildFoodsOption(),
          _buildCosmeticsOption(),
          _buildClothes(),
          _buildServicesOption(),
        ],
      ),
    );
  }

  Row _buildFoodsOption() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1. Food'),
              ValueListenableBuilder<Food>(
                valueListenable: _initFood,
                builder: (BuildContext context, Food value, Widget? child) {
                  return Row(
                    children: [
                      Flexible(
                        child: RadioListTile<Food>(
                          title: const Text('Fresh food'),
                          value: Food.fresh,
                          groupValue: _initFood.value,
                          onChanged: (Food? value) {
                            _initFood.value = value!;
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile<Food>(
                          title: const Text('Processed food'),
                          value: Food.processed,
                          groupValue: _initFood.value,
                          onChanged: (Food? value) {
                            _initFood.value = value!;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildCosmeticsOption() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('2. Cosmetics'),
              ValueListenableBuilder(
                  valueListenable: _initCosmetic,
                  builder:
                      (BuildContext context, Cosmetic value, Widget? child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Hair cosmetics'),
                                value: Cosmetic.hair,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Face cosmetics'),
                                value: Cosmetic.face,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Body cosmetics'),
                                value: Cosmetic.body,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Fragrances'),
                                value: Cosmetic.fragrance,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Miscellaneous cosmetics'),
                                value: Cosmetic.miscellaneous,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cosmetic>(
                                title: const Text('Other...'),
                                value: Cosmetic.other,
                                groupValue: _initCosmetic.value,
                                onChanged: (Cosmetic? value) {
                                  _initCosmetic.value = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildClothes() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('3. Clothes'),
              ValueListenableBuilder(
                  valueListenable: _initCloth,
                  builder: (BuildContext context, Cloth value, Widget? child) {
                    return Column(
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text(
                                    'Shirt, Blouse, T-shirt, Jacket'),
                                value: Cloth.shirt,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Trousers, Pants'),
                                value: Cloth.trouser,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Cap, Hat'),
                                value: Cloth.hat,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Scarf'),
                                value: Cloth.scarf,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Skirt'),
                                value: Cloth.skirt,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Shoes, Boot, Sneaker'),
                                value: Cloth.shoes,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Belt'),
                                value: Cloth.belt,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Accessory'),
                                value: Cloth.accessory,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile<Cloth>(
                                title: const Text('Bag, Handbag, Purse'),
                                value: Cloth.bag,
                                groupValue: _initCloth.value,
                                onChanged: (Cloth? value) {
                                  _initCloth.value = value!;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }

  Row _buildServicesOption() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('4. Services'),
              ValueListenableBuilder(
                valueListenable: _initService,
                builder: (BuildContext context, Service value, Widget? child) {
                  return Row(
                    children: [
                      Flexible(
                        child: RadioListTile<Service>(
                          title: const Text(
                              'Accommodation (Hotel, Resort, Hostel, Homestay)'),
                          value: Service.accommodation,
                          groupValue: _initService.value,
                          onChanged: (Service? value) {
                            _initService.value=value!;
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile<Service>(
                          title: const Text('Tour'),
                          value: Service.tour,
                          groupValue: _initService.value,
                          onChanged: (Service? value) {
                            _initService.value=value!;
                          },
                        ),
                      ),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ],
    );
  }
}
