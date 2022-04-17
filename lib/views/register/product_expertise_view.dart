import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';

enum SingingCharacter { lafayette, jefferson }

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
                        const Text('Processed food')
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
              Column(
                children: [
                  Wrap(
                    runSpacing: 5.0,
                    spacing: 5.0,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.shirt ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.shirt =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Shirt, Blouse, T-shirt, Jacket')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget.productExpertise.cloth?.trouser ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.trouser =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Trousers, Pants')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.cap ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.cap =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Cap, Hat')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.scarf ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.scarf =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Scarf')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.skirt ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.skirt =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Skirt')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.shoes ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.shoes =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Shoes, Boot, Sneaker')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.belt ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.belt =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Belt')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget.productExpertise.cloth?.accessory ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.accessory =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Accessory')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.cloth?.bag ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.cloth?.bag =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Bag, Handbag, Purse')
                          ],
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

  Row _buildServicesOption() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('4. Services'),
              Column(
                children: [
                  Wrap(
                    runSpacing: 5.0,
                    spacing: 5.0,
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget
                                      .productExpertise.service?.accomodation ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.service
                                      ?.accomodation = value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text(
                                'Accommodation (Hotel, Resort, Hostel, Homestay')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget.productExpertise.service?.tour ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.service?.tour =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Tour')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value:
                                  widget.productExpertise.service?.restaurant ??
                                      false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.service?.restaurant =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Restaurants')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget.productExpertise.service?.cafe ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.service?.cafe =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Cafe')
                          ],
                        ),
                      ),
                      Flexible(
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              value: widget.productExpertise.service?.other ??
                                  false,
                              onChanged: (bool? value) {
                                setState(() {
                                  widget.productExpertise.service?.other =
                                      value ?? false;
                                });
                                widget.onUpdateValue(widget.productExpertise);
                              },
                            ),
                            const Text('Other')
                          ],
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
}
