import 'package:flutter/material.dart';

class GeneralInfoView extends StatelessWidget {
  const GeneralInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownSex = 'Female';
    String dropdownStudent = 'Student';
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('General info'),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'First name'),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              children: [
                Row(),
                DropdownButton(
                    value: dropdownSex,
                    items: <String>['Female', 'Male']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      dropdownSex = value ?? '';
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
                    value: dropdownStudent,
                    items: <String>['Student', 'Male']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      dropdownStudent = value ?? '';
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
