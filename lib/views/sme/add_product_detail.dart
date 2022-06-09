import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/utilities/image_picker.dart';
import 'package:matching_reviewer/widgets/widgets.dart';

class AddProductDetail extends StatefulWidget {
  const AddProductDetail({Key? key}) : super(key: key);

  @override
  State<AddProductDetail> createState() => _AddProductDetailState();
}

class _AddProductDetailState extends State<AddProductDetail> {
  List<Uint8List> _imagesWidget = [];
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          _widgetCloseButton(),
          Form(
            // key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SelectableCategory(
                      onSelectCategory: (String category, String subCategory) {
                    print('category -> $category, sub -> $subCategory');
                  }),
                  _widgetConditionFormField(),
                  _widgetSelectAppointment(),
                  _widgetSelectImageButton(),
                  _widgetSubmitButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetCloseButton() {
    return Positioned(
      right: -40.0,
      top: -40.0,
      child: InkResponse(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const CircleAvatar(
            child: Icon(Icons.close),
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }

  Widget _widgetConditionFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: const InputDecoration(hintText: 'Conditions'),
      ),
    );
  }

  Widget _widgetSelectImageButton() {
    return GestureDetector(
      onTap: () async {
        // await getMultiImagesBytes();
        // setState(() {});
        _imagesWidget = await ImagePicker().getMultiImagesBytes(context);
        setState(() {});
      },
      child: _imagesWidget.isNotEmpty
          ? Container(
              width: MediaQuery.of(context).size.width / 4,
              height: 400,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  _imagesWidget.length,
                  (index) => Container(
                    child: _imagesWidget.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.memory(
                              _imagesWidget[index],
                            ),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                            ),
                            child: Column(
                              children: const [
                                Icon(Icons.photo_album),
                                Text('เลือกรูปภาพไม่เกิน 5 รูป')
                              ],
                            ),
                          ),
                  ),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              width: MediaQuery.of(context).size.width / 4,
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.photo_album),
                  Text('เลือกรูปภาพไม่เกิน 5 รูป')
                ],
              ),
            ),
    );
  }

  Widget _widgetSubmitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text("Submit"),
        onPressed: () {
          // if (_formKey.currentState.validate()) {
          //   _formKey.currentState.save();
          // }
        },
      ),
    );
  }

  _widgetSelectAppointment() {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    Future<void> _selectTime() async {
      final TimeOfDay? pickedTime =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (pickedTime != null && pickedTime != selectedTime) {
        setState(() {
          selectedDate = DateTime(selectedDate.year, selectedDate.month,
              selectedDate.day, selectedTime.hour, selectedTime.minute);
          selectedTime = pickedTime;
        });
      }
    }

    return Row(
      children: [
        Text(
            'Appointment : ${DateFormat('dd-MM-yyyy - HH:mm').format(selectedDate)}'),
        TextButton(
            child: const Text('Select date.'),
            onPressed: () => _selectDate(context)),
        TextButton(
            child: const Text('Select time.'), onPressed: () => _selectTime()),
      ],
    );
  }
}
