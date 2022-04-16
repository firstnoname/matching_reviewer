import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';

enum SingingCharacter { lafayette, jefferson }

enum Cloth { shirt, trouser, hat, scarf, skirt, shoes, belt, accessory, bag }
enum Service { accommodation, tour, restaurant, cafe }

class ProductExpertiseView extends StatefulWidget {
  final ProductExpertise productExpertise;
  final Function(ProductExpertise) onUpdateValue;

  const ProductExpertiseView(
      {Key? key, required this.productExpertise, required this.onUpdateValue})
      : super(key: key);

  @override
  State<ProductExpertiseView> createState() => _ProductExpertiseViewState();
}

class _ProductExpertiseViewState extends State<ProductExpertiseView> {
  final ValueNotifier<Cloth> _initCloth = ValueNotifier(Cloth.shirt);

  final ValueNotifier<Service> _initService =
      ValueNotifier(Service.accommodation);

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
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value:
                              widget.productExpertise.food?.freshFood ?? false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.productExpertise.food?.freshFood =
                                  value ?? false;
                            });
                            widget.onUpdateValue(widget.productExpertise);
                          },
                        ),
                        const Text('Fresh food')
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: widget.productExpertise.food?.processedFood ??
                              false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.productExpertise.food?.processedFood =
                                  value ?? false;
                            });
                          },
                        ),
                        const Text('Proccessed food')
                      ],
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

  Row _buildCosmeticsOption() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('2. Cosmetics'),
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value:
                              widget.productExpertise.cosmetic?.hairCosmetic ??
                                  false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.productExpertise.cosmetic?.hairCosmetic =
                                  value ?? false;
                            });
                            widget.onUpdateValue(widget.productExpertise);
                          },
                        ),
                        const Text('Hair cosmetic')
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value:
                              widget.productExpertise.cosmetic?.faceCosmetics ??
                                  false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.productExpertise.cosmetic?.faceCosmetics =
                                  value ?? false;
                            });
                            widget.onUpdateValue(widget.productExpertise);
                          },
                        ),
                        const Text('Face cosmetic')
                      ],
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value:
                              widget.productExpertise.cosmetic?.bodyCosmetics ??
                                  false,
                          onChanged: (bool? value) {
                            setState(() {
                              widget.productExpertise.cosmetic?.bodyCosmetics =
                                  value ?? false;
                            });
                            widget.onUpdateValue(widget.productExpertise);
                          },
                        ),
                        const Text('Body cosmetics')
                      ],
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

  Row _buildClothes() {
    // shirt, trouser, hat, scarf, skirt, shoes, belt, accessory, bag
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
                              child: Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    value: widget.productExpertise.cosmetic
                                            ?.bodyCosmetics ??
                                        false,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        widget.productExpertise.cosmetic
                                            ?.bodyCosmetics = value ?? false;
                                      });
                                      widget.onUpdateValue(
                                          widget.productExpertise);
                                    },
                                  ),
                                  const Text('Shirt, Blouse, T-shirt, Jacket')
                                ],
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
                  builder:
                      (BuildContext context, Service value, Widget? child) {
                    return Row(
                      children: [
                        Flexible(
                          child: RadioListTile<Service>(
                            title: const Text(
                                'Accommodation (Hotel, Resort, Hostel, Homestay)'),
                            value: Service.accommodation,
                            groupValue: _initService.value,
                            onChanged: (Service? value) {
                              _initService.value = value!;
                            },
                          ),
                        ),
                        Flexible(
                          child: RadioListTile<Service>(
                            title: const Text('Tour'),
                            value: Service.tour,
                            groupValue: _initService.value,
                            onChanged: (Service? value) {
                              _initService.value = value!;
                            },
                          ),
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
}
