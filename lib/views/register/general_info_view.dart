import 'package:flutter/material.dart';
import 'package:matching_reviewer/utilities/utilities.dart';

class GeneralInfoView extends StatelessWidget {
  const GeneralInfoView({Key? key}) : super(key: key);

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
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Last name'),
                  validator: (value) =>
                      Validator(context).isNotEmpty(value: value),
                  onFieldSubmitted: (value) {},
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
                  builder: (BuildContext context, String value, Widget? child) {
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
                      },
                    );
                  }
                )
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
                  items: <String>['Student', '']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    dropdownStudent.value = value ?? '';
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
