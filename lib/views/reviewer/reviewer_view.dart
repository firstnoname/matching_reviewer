import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/blocs.dart';
import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/views/reviewer/bloc/reviewer_bloc.dart';
import 'package:matching_reviewer/widgets/widgets.dart';

class ReviewerView extends StatelessWidget {
  const ReviewerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User _reviewer = context.read<AppManagerBloc>().member;

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: BlocProvider(
              create: (context) => ReviewerBloc()
                ..add(ReviewerEventGetProduct(reviewerId: _reviewer.id!)),
              child: BlocBuilder<ReviewerBloc, ReviewerState>(
                builder: (context, state) {
                  List<Matching> _products = [];
                  if (state is ReviewerStateGetProductSuccess) {
                    _products = state.products;
                  }
                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Reviewer'),
                        ),
                      ),
                      Expanded(
                        child: ProductsCardList(
                            products: _products,
                            onUploadReviewForm: (FilePickerResult pickedFile,
                                String matchingID) async {
                              context.read<ReviewerBloc>().add(
                                  ReviewerEventUploadFile(
                                      pickedFile: pickedFile,
                                      matchingID: matchingID));
                              debugPrint(
                                  'picked file name -> ${pickedFile.names}');
                            }),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
