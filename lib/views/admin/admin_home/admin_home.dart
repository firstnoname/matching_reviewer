import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_reviewer/views/admin/admin_home/bloc/home_bloc.dart';
import 'package:matching_reviewer/widgets/widgets.dart';

import '../../../models/models.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(HomeEventReadProducts()),
      child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        List<Matching> _products = [];
        if (state is HomeStateReadProductsSuccess) {
          _products = state.products;
        } else if (state is HomeStateUpdateProdSuccess) {
          _products = state.products;
        }
        return DefaultTabController(
          length: 3,
          child: Column(
            children: [
              const TabBar(
                tabs: [
                  Tab(
                      child: Text(
                    'จับคู่',
                    style: TextStyle(color: Colors.blue),
                  )),
                  Tab(
                      child: Text(
                    'กำลังดำเนินการ',
                    style: TextStyle(color: Colors.blue),
                  )),
                  Tab(
                      child: Text(
                    'ตรวจสอบรีวิวฟอร์ม',
                    style: TextStyle(color: Colors.blue),
                  )),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ProductsCardList(
                        userRole: UserRoles.admin,
                        products: _products
                            .where((prod) => prod.reviewer == null)
                            .toList()),
                    ProductsCardList(
                        userRole: UserRoles.admin,
                        products: _products
                            .where((prod) => (prod.reviewer != null &&
                                prod.product!.reviewedFormPath == null))
                            .toList()),
                    ProductsCardList(
                        userRole: UserRoles.admin,
                        products: _products
                            .where((prod) =>
                                prod.product!.reviewedFormPath != null &&
                                prod.status == MatchingCaseStatus.enable)
                            .toList(),
                        onCloseCase: (String prodId) async {
                          context
                              .read<HomeBloc>()
                              .add(HomeEventCloseCase(prodIdToDisable: prodId));
                        }),
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
