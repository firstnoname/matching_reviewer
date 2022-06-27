import 'package:flutter/material.dart';

enum SmallSME { production, services }

enum MediumSME { production, services }

enum LargeSME { production, services }

class EntrepreneurView extends StatelessWidget {
  EntrepreneurView({Key? key}) : super(key: key);

  final ValueNotifier<SmallSME> _initSmallSME =
      ValueNotifier(SmallSME.production);
  final ValueNotifier<MediumSME> _initMediumSME =
      ValueNotifier(MediumSME.production);
  final ValueNotifier<LargeSME> _initLargeSME =
      ValueNotifier(LargeSME.production);

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
          _buildSmallSMEs(),
          _buildMediumSMEs(),
          _buildLargeSMEs(),
        ],
      ),
    );
  }

  _buildSmallSMEs() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1. Small SMEs'),
              ValueListenableBuilder<SmallSME>(
                valueListenable: _initSmallSME,
                builder: (BuildContext context, SmallSME value, Widget? child) {
                  return Row(
                    children: [
                      Flexible(
                        child: RadioListTile<SmallSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Production'),
                              Text('-Less than 5 workers'),
                              Text('-Less than 1.8 million bth/year')
                            ],
                          ),
                          value: SmallSME.production,
                          groupValue: _initSmallSME.value,
                          onChanged: (SmallSME? value) {
                            _initSmallSME.value = value!;
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile<SmallSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Services'),
                              Text('-Less than 5 workers'),
                              Text('-Less than 1.8 million bth/year')
                            ],
                          ),
                          value: SmallSME.services,
                          groupValue: _initSmallSME.value,
                          onChanged: (SmallSME? value) {
                            _initSmallSME.value = value!;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildMediumSMEs() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1. Medium SMEs'),
              ValueListenableBuilder<MediumSME>(
                valueListenable: _initMediumSME,
                builder:
                    (BuildContext context, MediumSME value, Widget? child) {
                  return Row(
                    children: [
                      Flexible(
                        child: RadioListTile<MediumSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Production'),
                              Text('-Less than 50 workers'),
                              Text('-Less than 100 million bth/year')
                            ],
                          ),
                          value: MediumSME.production,
                          groupValue: _initMediumSME.value,
                          onChanged: (MediumSME? value) {
                            _initMediumSME.value = value!;
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile<MediumSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Services'),
                              Text('-Less than 30 workers'),
                              Text('-Less than 50 million bth/year')
                            ],
                          ),
                          value: MediumSME.services,
                          groupValue: _initMediumSME.value,
                          onChanged: (MediumSME? value) {
                            _initMediumSME.value = value!;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildLargeSMEs() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('1. Large SMEs'),
              ValueListenableBuilder<LargeSME>(
                valueListenable: _initLargeSME,
                builder: (BuildContext context, LargeSME value, Widget? child) {
                  return Row(
                    children: [
                      Flexible(
                        child: RadioListTile<LargeSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Production'),
                              Text('-Less than 200 workers'),
                              Text('-Less than 500 million bth/year')
                            ],
                          ),
                          value: LargeSME.production,
                          groupValue: _initLargeSME.value,
                          onChanged: (LargeSME? value) {
                            _initLargeSME.value = value!;
                          },
                        ),
                      ),
                      Flexible(
                        child: RadioListTile<LargeSME>(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Services'),
                              Text('-Less than 100 workers'),
                              Text('-Less than 300 million bth/year')
                            ],
                          ),
                          value: LargeSME.services,
                          groupValue: _initLargeSME.value,
                          onChanged: (LargeSME? value) {
                            _initLargeSME.value = value!;
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
