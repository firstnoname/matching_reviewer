import 'package:flutter/material.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/utilities/utilities.dart';

class GeneralInfoView extends StatelessWidget {
  final User userInfo;
  final Function(User) onUpdateUserInfo;

  const GeneralInfoView(
      {Key? key, required this.userInfo, required this.onUpdateUserInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<String> dropdownSex = ValueNotifier('Female');
    ValueNotifier<String> dropdownStudent = ValueNotifier('Student');
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                const Text('Occupation'),
                const SizedBox(width: 16),
                DropdownButton(
                  value: dropdownStudent.value,
                  items: <String>['Student', 'Political']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    dropdownStudent.value = value ?? '';
                    userInfo.occupation = value;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
