import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/views/matching_view/bloc/matching_bloc.dart';

import '../../widgets/widgets.dart';

class MatchingView extends StatelessWidget {
  const MatchingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matching'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => MatchingBloc()..add(MatchingEventInit()),
          child: BlocBuilder<MatchingBloc, MatchingState>(
            builder: (context, state) {
              if (state is MatchingStateGetProductSuccess) {
                return _listBuilderOptionOne(
                    context: context, products: state.matchingList);
              } else if (state is MatchingSelectRoleSuccess) {
                return _selectCategory(context);
              } else if (state is MatchingStateGetOptionsOneSuccess) {
                return _listBuilderOptionOne(
                    context: context, products: state.products);
              } else if (state is MatchingStateSelectOptionOneSuccess) {
                return _listBuilderOptionTwo(context, users: state.userList);
              } else if (state is MatchingStateApproveSuccess) {
                Navigator.pop(context);
                return _listBuilderOptionOne(
                    context: context, products: state.products);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _selectRole(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Entrepreneur'),
              onPressed: () => context.read<MatchingBloc>().add(
                  MatchingEventSelectedRole(
                      selectedRole: UserRoles.entrepreneur)),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              child: const Text('Reviewer'),
              onPressed: () => context.read<MatchingBloc>().add(
                  MatchingEventSelectedRole(selectedRole: UserRoles.reviewer)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSelectCategory(BuildContext context) {
    // return SelectableCategory(
    //     onSelectCategory: (String category, String subCategory) => context
    //         .read<MatchingBloc>()
    //         .add(MatchingSelectedCategory(
    //             selectedCategory: category, selectedSubCategory: subCategory)));
    return SelectableCategory.forMatchingView(
        onSelectCategory: (String category, String subCategory) => context
            .read<MatchingBloc>()
            .add(MatchingSelectedCategory(
                selectedCategory: category, selectedSubCategory: subCategory)));
  }

  Widget _selectCategory(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'food',
                        selectedSubCategory: 'fresh_food')),
                child: const ChipGenerator(
                    label: 'Fresh food', color: Color(0xFFff6666))),
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'food',
                      selectedSubCategory: 'processed_food')),
              child: const ChipGenerator(
                  label: 'Process food', color: Color(0xFFff6666)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cosmetic',
                        selectedSubCategory: 'hair_cosmetic')),
                child: const ChipGenerator(
                    label: 'Hair cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cosmetic',
                        selectedSubCategory: 'face_cosmetic')),
                child: const ChipGenerator(
                    label: 'Face cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cosmetic',
                        selectedSubCategory: 'body_cosmetic')),
                child: const ChipGenerator(
                    label: 'Body cosmetics', color: Color(0xFF007f5c))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cosmetic',
                        selectedSubCategory: 'fragrances')),
                child: const ChipGenerator(
                    label: 'Fragrances', color: Color(0xFF007f5c))),
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'cosmetic',
                      selectedSubCategory: 'miscellaneous_cosmetic')),
              child: const ChipGenerator(
                  label: 'Miscellaneous cosmetics', color: Color(0xFF007f5c)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'cloth', selectedSubCategory: 'shirt')),
              child: const ChipGenerator(
                  label: 'Shirt, Blouse, T-shirt, Jacket',
                  color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth',
                        selectedSubCategory: 'trouser')),
                child: const ChipGenerator(
                    label: 'Trousers, Pants', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth', selectedSubCategory: 'cap')),
                child: const ChipGenerator(
                    label: 'Cap, Hat', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth',
                        selectedSubCategory: 'scarf')),
                child: const ChipGenerator(
                    label: 'Scarf', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth',
                        selectedSubCategory: 'skirt')),
                child: const ChipGenerator(
                    label: 'Skirt', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'cloth', selectedSubCategory: 'shoes')),
              child: const ChipGenerator(
                  label: 'Shoes, Boot, Sneaker', color: Color(0xFF5f65d3)),
            ),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth',
                        selectedSubCategory: 'belt')),
                child: const ChipGenerator(
                    label: 'Belt', color: Color(0xFF5f65d3))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'cloth',
                        selectedSubCategory: 'accessory')),
                child: const ChipGenerator(
                    label: 'Accessory', color: Color(0xFF5f65d3))),
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'cloth', selectedSubCategory: 'bag')),
              child: const ChipGenerator(
                  label: 'Bag, Handbag, Purse', color: Color(0xFF5f65d3)),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => context.read<MatchingBloc>().add(
                  MatchingSelectedCategory(
                      selectedCategory: 'service',
                      selectedSubCategory: 'accommodation')),
              child: const ChipGenerator(
                  label: 'Accommodation(Hotel, Resort, Hostel)',
                  color: Color(0xFF19ca21)),
            ),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'service',
                        selectedSubCategory: 'tour')),
                child: const ChipGenerator(
                    label: 'tour', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'service',
                        selectedSubCategory: 'restaurant')),
                child: const ChipGenerator(
                    label: 'Restaurants', color: Color(0xFF19ca21))),
            GestureDetector(
                onTap: () => context.read<MatchingBloc>().add(
                    MatchingSelectedCategory(
                        selectedCategory: 'service',
                        selectedSubCategory: 'cafe')),
                child: const ChipGenerator(
                    label: 'Cafe', color: Color(0xFF19ca21)))
          ],
        ),
      ],
    );
  }

  Widget _listBuilderOptionOne(
      {required BuildContext context, required List<Matching> products}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Select Entrepreneur',
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
        ),
        products.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => context.read<MatchingBloc>().add(
                      MatchingEventSelectOptionOne(matching: products[index])),
                  child: UserCardWidget(matchingInfo: products[index]),
                ),
              )
            : _noData(context),
      ],
    );
  }

  Widget _listBuilderOptionTwo(BuildContext context,
      {required List<User> users}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Select reviewer',
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.04),
          ),
        ),
        users.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (ctx, index) => GestureDetector(
                  onTap: () {
                    context.read<MatchingBloc>().add(
                        MatchingEventSelectOptionTwo(optionTwo: users[index]));
                    _showMyDialog(context,
                        approveFunc: () => context
                            .read<MatchingBloc>()
                            .add(MatchingEventApproved()));
                  },
                  child: UserCardWidget(userInfo: users[index]),
                ),
              )
            : _noData(context),
      ],
    );
  }

  Widget _noData(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 8),
          SvgPicture.asset(
            'assets/images/info.svg',
            color: Colors.yellow,
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.height * 0.06,
          ),
          const SizedBox(height: 8),
          const Text('No data'),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context,
      {required Function approveFunc}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext ctx) {
        return AlertDialog(
          title:
              const Text('Confirm paring between reviewer and entrepreneur?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: [
                    UserCardWidget(
                        userInfo: context.read<MatchingBloc>().optionOne),
                    UserCardWidget(
                        userInfo: context.read<MatchingBloc>().optionTwo),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              style: TextButton.styleFrom(primary: Colors.lightGreen),
              onPressed: () {
                approveFunc();
                // Navigator.of(ctx).pop();
                // Navigator.of(ctx).pop();
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              style: TextButton.styleFrom(primary: Colors.red),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
