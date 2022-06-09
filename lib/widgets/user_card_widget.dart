import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';

import 'widgets.dart';

class UserCardWidget extends StatelessWidget {
  final User? userInfo;

  const UserCardWidget({Key? key, this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: userInfo?.userRole == 'reviewer'
          ? Colors.blueAccent[100]
          : Colors.redAccent[100],
      child: Row(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: userInfo?.imageProfilePath != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(userInfo!.imageProfilePath!))
                  : const CircleAvatar(radius: 50, child: Icon(Icons.people))),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('${userInfo?.firstName} ${userInfo?.lastName}',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              Row(
                children: [
                  userInfo?.productExpertise?.food?.freshFood == true
                      ? const ChipGenerator(
                          label: 'Fresh food', color: Color(0xFFff6666))
                      : Container(),
                  userInfo?.productExpertise?.food?.processedFood == true
                      ? const ChipGenerator(
                          label: 'Processed food', color: Color(0xFFff6666))
                      : Container(),
                ],
              ),
              Row(
                children: [
                  userInfo?.productExpertise?.cosmetic?.hairCosmetic == true
                      ? const ChipGenerator(
                          label: 'Hair cosmetics', color: Color(0xFF007f5c))
                      : Container(),
                  userInfo?.productExpertise?.cosmetic?.faceCosmetics == true
                      ? const ChipGenerator(
                          label: 'Face cosmetics', color: Color(0xFF007f5c))
                      : Container(),
                  userInfo?.productExpertise?.cosmetic?.bodyCosmetics == true
                      ? const ChipGenerator(
                          label: 'Body cosmetics', color: Color(0xFF007f5c))
                      : Container(),
                  userInfo?.productExpertise?.cosmetic?.fragrances == true
                      ? const ChipGenerator(
                          label: 'Fragrances', color: Color(0xFF007f5c))
                      : Container(),
                  userInfo?.productExpertise?.cosmetic?.miscelaneousCosmetic ==
                          true
                      ? const ChipGenerator(
                          label: 'Miscellaneous cosmetics',
                          color: Color(0xFF007f5c))
                      : Container(),
                ],
              ),
              Row(
                children: [
                  userInfo?.productExpertise?.cloth?.shirt == true
                      ? const ChipGenerator(
                          label: 'Shirt, Blouse, T-shirt, Jacket',
                          color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.trouser == true
                      ? const ChipGenerator(
                          label: 'Trousers, Pants', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.cap == true
                      ? const ChipGenerator(
                          label: 'Cap, Hat', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.scarf == true
                      ? const ChipGenerator(
                          label: 'Scarf', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.skirt == true
                      ? const ChipGenerator(
                          label: 'Skirt', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.shoes == true
                      ? const ChipGenerator(
                          label: 'Shoes, Boot, Sneaker',
                          color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.belt == true
                      ? const ChipGenerator(
                          label: 'Belt', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.accessory == true
                      ? const ChipGenerator(
                          label: 'Accessory', color: Color(0xFF5f65d3))
                      : Container(),
                  userInfo?.productExpertise?.cloth?.bag == true
                      ? const ChipGenerator(
                          label: 'Bag, Handbag, Purse',
                          color: Color(0xFF5f65d3))
                      : Container(),
                ],
              ),
              Row(
                children: [
                  userInfo?.productExpertise?.service?.accomodation == true
                      ? const ChipGenerator(
                          label: 'Accommodation(Hotel, Resort, Hostel)',
                          color: Color(0xFF19ca21))
                      : Container(),
                  userInfo?.productExpertise?.service?.restaurant == true
                      ? const ChipGenerator(
                          label: 'Restaurants', color: Color(0xFF19ca21))
                      : Container(),
                  userInfo?.productExpertise?.service?.cafe == true
                      ? const ChipGenerator(
                          label: 'Cafe', color: Color(0xFF19ca21))
                      : Container(),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
