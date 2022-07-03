import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/utilities/utilities.dart';

class GeneralInfoView extends StatelessWidget {
  final User userInfo;
  final Function(User) onUpdateUserInfo;
  final bool isReviewer;

  const GeneralInfoView(
      {Key? key,
      required this.userInfo,
      required this.onUpdateUserInfo,
      required this.isReviewer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> dropdownSex = ValueNotifier('Female');
    ValueNotifier<String> dropdownOccupation = ValueNotifier('Student');
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('General info'),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'First name'),
                  validator: (value) =>
                      Validator(context).isNotEmpty(value: value),
                  onChanged: (value) => userInfo.firstName = value,
                  onFieldSubmitted: (value) => userInfo.firstName = value,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Last name'),
                  validator: (value) =>
                      Validator(context).isNotEmpty(value: value),
                  onChanged: (value) => userInfo.lastName = value,
                  onFieldSubmitted: (value) {
                    userInfo.lastName = value;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Email'),
            onChanged: (value) => userInfo.email = value,
            validator: (value) => Validator(context).isNotEmpty(value: value),
            onFieldSubmitted: (value) => userInfo.email = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                ValueListenableBuilder(
                    valueListenable: dropdownSex,
                    builder:
                        (BuildContext context, String value, Widget? child) {
                      return DropdownButton(
                        value: dropdownSex.value,
                        items: <String>['Female', 'Male']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          dropdownSex.value = value ?? '';
                          userInfo.sex = value;
                        },
                      );
                    })
              ],
            ),
          ),
          isReviewer == true
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children: [
                      const Text('Occupation'),
                      const SizedBox(width: 16),
                      ValueListenableBuilder(
                          valueListenable: dropdownOccupation,
                          builder: (BuildContext context, String value,
                              Widget? child) {
                            return DropdownButton(
                              value: dropdownOccupation.value,
                              items: <String>[
                                'Student',
                                'Office worker',
                                'Government officer',
                                'Business owner',
                                'Other ...'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                dropdownOccupation.value = value ?? '';
                                userInfo.occupation = value;
                              },
                            );
                          }),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
