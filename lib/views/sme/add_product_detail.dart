import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/utilities/image_picker.dart';
import 'package:matching_reviewer/views/sme/bloc/sme_view_bloc.dart';
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
  String _category = '';
  String _subCategory = '';
  final _conditionText = TextEditingController();
  final _prodName = TextEditingController();
  bool _isZoomSelected = true;
  Uint8List? _slipTransfer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SmeViewBloc, SmeViewState>(
      builder: (context, state) {
        if (state is SmeViewStateSubmitSuccess) {
          // Navigator.pop(context);
        }
        return AlertDialog(
          content: Stack(
            children: <Widget>[
              _widgetCloseButton(),
              Form(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SelectableCategory(onSelectCategory:
                          (String category, String subCategory) {
                        _category = category;
                        _subCategory = subCategory;
                        debugPrint(
                            'category -> $category, sub -> $subCategory');
                      }),
                      _widgetProductNameFormField(),
                      _widgetConditionFormField(),
                      _widgetReviewOptions(),
                      _isZoomSelected == true
                          ? _widgetSelectAppointment()
                          : Container(),
                      _widgetSelectImageButton(),
                      _slipTransfer == null
                          ? Container()
                          : _widgetSubmitButton(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

  Widget _widgetProductNameFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _prodName,
        decoration: const InputDecoration(hintText: 'Product name'),
        onSaved: (value) {},
      ),
    );
  }

  Widget _widgetConditionFormField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _conditionText,
        decoration: const InputDecoration(hintText: 'Conditions'),
        onSaved: (value) {},
      ),
    );
  }

  Widget _widgetSelectImageButton() {
    return GestureDetector(
      onTap: () async {
        _imagesWidget =
            await ImagePicker().getMultiImagesBytes(context, maxImages: 5);
        setState(() {});
      },
      child: _imagesWidget.isNotEmpty
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: GridView.count(
                crossAxisCount: 4,
                children: List.generate(
                  _imagesWidget.length,
                  (index) => Container(
                    child: _imagesWidget.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.memory(
                              _imagesWidget[index],
                              width: 20,
                              height: 20,
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
              width: MediaQuery.of(context).size.width,
              height: 200,
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
              selectedDate.day, pickedTime.hour, pickedTime.minute);
          // selectedTime = pickedTime;
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

  Widget _widgetReviewOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Select review method : '),
              ChoiceChip(
                label: const Text("Zoom discussion (30,000 Baht)"),
                selected: _isZoomSelected,
                onSelected: (bool value) {
                  setState(() {
                    _isZoomSelected = !_isZoomSelected;
                  });
                },
                selectedColor: Colors.green,
              ),
              const SizedBox(width: 8),
              ChoiceChip(
                label: const Text("Review by only reviewer (15,000 Baht)"),
                selected: !_isZoomSelected,
                onSelected: (bool value) {
                  setState(() {
                    _isZoomSelected = !_isZoomSelected;
                  });
                },
                selectedColor: Colors.green,
              ),
              const SizedBox(width: 16),
              const Text('** กรุณาชำระเงินก่อนส่งแบบฟอร์ม',
                  style: TextStyle(color: Colors.red)),
            ],
          ),
          Row(
            children: [
              const Text('อัพโหลดสลิปการโอนเงิน: '),
              _slipTransfer == null
                  ? Container()
                  : Image.memory(
                      _slipTransfer!,
                      width: 150,
                      height: 150,
                    ),
              TextButton(
                child: const Text('Choose file'),
                onPressed: () async {
                  _slipTransfer = await ImagePicker().getImageBytes();
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _widgetSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        child: const Text("Submit"),
        onPressed: () {
          User userInfo = BlocProvider.of<AppManagerBloc>(context).member!;
          context.read<SmeViewBloc>().add(SmeViewEventSubmitProduct(
              entrepreneur: userInfo,
              category: _category,
              subCategory: _subCategory,
              conditions: _conditionText.text,
              appointment: selectedDate,
              prodName: _prodName.text,
              images: _imagesWidget,
              paymentType: _isZoomSelected == true
                  ? PaymentType.discussions
                  : PaymentType.noDiscussions,
              paymentSlip: _slipTransfer!));
          Navigator.pop(context);
        },
      ),
    );
  }
}
