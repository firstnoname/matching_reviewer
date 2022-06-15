import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/blocs/app_manager/bloc/app_manager_bloc.dart';
import 'package:matching_reviewer/models/matching.dart';
import 'package:matching_reviewer/views/sme/bloc/sme_view_bloc.dart';
import 'package:matching_reviewer/views/views.dart';

class SMEView extends StatelessWidget {
  const SMEView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Matching> _products = [];
    return BlocProvider(
      create: (context) =>
          SmeViewBloc(userID: context.read<AppManagerBloc>( ).member.id)
            ..add(SmeViewEventInitial()),
      child: BlocBuilder<SmeViewBloc, SmeViewState>(
        builder: (context, state) {
          if (state is SmeViewStateGetProductListSuccess) {
            _products = state.products;
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext ctx) => BlocProvider.value(
                                value: context.read<SmeViewBloc>(),
                                child: const AddProductDetail(),
                              )),
                      child: Row(
                        children: const [
                          Icon(Icons.add),
                          Text('เพิ่มข้อมูลสินค้า')
                        ],
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _products.length,
                    itemBuilder: (context, index) => Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: _products[index]
                                        .product
                                        ?.pictures
                                        ?.first !=
                                    null
                                ? CircleAvatar(
                                    radius: (100),
                                    backgroundColor: Colors.white,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                          _products[index]
                                              .product
                                              ?.pictures
                                              ?.first,
                                          fit: BoxFit.contain),
                                    ))
                                : Container(),
                            title: Text(
                                _products[index].product?.productName ?? ''),
                            subtitle: Text(
                                _products[index].product?.conditions ?? ''),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('Details'),
                                onPressed: () {
                                  /* ... */
                                },
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
