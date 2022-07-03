import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/models.dart';

class ProductsCardList extends StatelessWidget {
  final UserRoles userRole;
  final List<Matching> products;

  // final Function? onSubmit;
  // final Function? onDecline;
  final Function? onUploadReviewForm;
  final Function? onCloseCase;

  const ProductsCardList(
      {Key? key,
      required this.userRole,
      required this.products,
      // this.onSubmit,
      // this.onDecline,
      this.onUploadReviewForm,
      this.onCloseCase})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/info.svg',
                color: Colors.yellow,
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.height * 0.06,
              ),
              const SizedBox(height: 8),
              const Text('ไม่มีข้อมูล'),
            ],
          ))
        : ListView.builder(
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) => Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: products[index].product!.pictures!.isNotEmpty
                              ? CircleAvatar(
                                  radius: (100),
                                  backgroundColor: Colors.white,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.network(
                                        products[index]
                                            .product
                                            ?.pictures
                                            ?.first,
                                        fit: BoxFit.contain),
                                  ))
                              : const SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                          title: Text(
                              'ชื่อสินค้า: ${products[index].product?.productName ?? ''}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'เงื่อนไข: ${products[index].product?.conditions ?? 'ไม่มีข้อมูล'}'),
                              Text(
                                'email: ${products[index].entrepreneur?.email ?? 'ไม่มีข้อมูล'}',
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            TextButton(
                              child: const Text('Details'),
                              onPressed: () => _productDetail(context,
                                  productDetail: products[index]),
                            ),
                            const SizedBox(width: 8),
                            userRole == UserRoles.admin
                                ? _showDownloadReviewedFormForAdmin(index)
                                : const SizedBox(),
                            userRole == UserRoles.reviewer &&
                                    products[index].product?.reviewedFormPath ==
                                        null
                                ? TextButton(
                                    onPressed: () => launchUrlString(
                                        'https://firebasestorage.googleapis.com/v0/b/matching-reviewer.appspot.com/o/review_form%2Freview_form.docx?alt=media&token=a1fc7c8f-b345-4f07-9f41-f60648a9597c'),
                                    child: Row(
                                      children: const [
                                        Text('ดาวน์โหลดรีวิวฟอร์ม',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                        Icon(Icons.get_app, color: Colors.blue),
                                      ],
                                    ))
                                : const SizedBox(),
                            userRole == UserRoles.reviewer &&
                                    products[index].product?.reviewedFormPath ==
                                        null
                                ? TextButton(
                                    child: Row(
                                      children: const [
                                        Icon(Icons.upload_file,
                                            color: Colors.amber),
                                        Text(
                                          'อัพโหลดฟอร์ม',
                                          style: TextStyle(color: Colors.amber),
                                        ),
                                      ],
                                    ),
                                    onPressed: () async {
                                      var pickedFile = await FilePickerWeb
                                          .platform
                                          .pickFiles();
                                      if (pickedFile != null) {
                                        return _uploadDialog(context,
                                            title: 'ยืนยันการอัพโหลดฟอร์ม',
                                            matchingID: products[index].id!,
                                            pickedFile: pickedFile,
                                            uploadFunc: onUploadReviewForm!);
                                      }
                                    },
                                  )
                                : userRole == UserRoles.reviewer &&
                                        products[index]
                                                .product
                                                ?.reviewedFormPath !=
                                            null
                                    ? Row(
                                        children: const [
                                          Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            'อัพโหลดฟอร์มสำเร็จแล้ว',
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                            // onSubmit == null
                            //     ? Container()
                            //     : TextButton(
                            //         child: Row(
                            //           children: const [
                            //             Text(
                            //               'ตกลง',
                            //               style:
                            //                   TextStyle(color: Colors.green),
                            //             ),
                            //             Icon(
                            //               Icons.check,
                            //               color: Colors.green,
                            //             )
                            //           ],
                            //         ),
                            //         onPressed: () => _confirmDialog(context,
                            //             title: '', confirm: onSubmit!),
                            //       ),
                            // onSubmit == null
                            //     ? Container()
                            //     : TextButton(
                            //         child: Row(
                            //           children: const [
                            //             Text(
                            //               'ยกเลิก',
                            //               style: TextStyle(color: Colors.red),
                            //             ),
                            //             Icon(
                            //               Icons.close,
                            //               color: Colors.red,
                            //             )
                            //           ],
                            //         ),
                            //         onPressed: () => _confirmDialog(context,
                            //             title: '', confirm: onDecline!),
                            //       ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                onCloseCase == null ||
                        products[index].status == MatchingCaseStatus.disable
                    ? const SizedBox()
                    : GestureDetector(
                        // onTap: () {
                        //   onCloseCase!(products[index].id);
                        // },
                        onTap: () => _confirmDialog(context,
                            title: 'ยืนยันปิดเคสนี้',
                            prodId: products[index].id!,
                            confirm: onCloseCase!),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.check_circle, color: Colors.green),
                                Text('ปิดเคส',
                                    style: TextStyle(color: Colors.green))
                              ],
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          );
  }

  Future _uploadDialog(BuildContext context,
      {required String title,
      required String matchingID,
      required FilePickerResult pickedFile,
      required Function uploadFunc}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 2.5,
              height: MediaQuery.of(context).size.height / 2.5,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: MediaQuery.of(context).size.height * 0.04),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/images/document.svg',
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text('${pickedFile.names.single}'),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {
                              uploadFunc(pickedFile, matchingID);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'ตกลง',
                              style: TextStyle(color: Colors.green),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('ยกเลิก',
                                style: TextStyle(color: Colors.red))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future _confirmDialog(BuildContext context,
      {required String title,
      required String prodId,
      required Function confirm}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2.5,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Column(
              children: [
                Expanded(
                  child: Center(child: Text(title)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () async {
                            await confirm(prodId);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'ตกลง',
                            style: TextStyle(color: Colors.green),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text(
                            'ยกเลิก',
                            style: TextStyle(color: Colors.red),
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future _productDetail(BuildContext context,
      {required Matching productDetail}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1,
              height: MediaQuery.of(context).size.height / 1,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'ชื่อสินค้า: ${productDetail.product!.productName!}'),
                          const SizedBox(height: 8),
                          Text(
                              'เงื่อนไข: ${productDetail.product!.conditions!}'),
                          const SizedBox(height: 8),
                          Row(
                            children: productDetail.product!.pictures!
                                .map((picture) => Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Image.network(
                                        picture,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                6,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                6,
                                      ),
                                    ))
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text(
                                'ปิด',
                                style: TextStyle(color: Colors.red),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  _showDownloadReviewedFormForAdmin(int index) {
    return products[index].product?.reviewedFormPath != null
        ? TextButton(
            onPressed: () =>
                launchUrlString('${products[index].product?.reviewedFormPath}'),
            // 'https://firebasestorage.googleapis.com/v0/b/matching-reviewer.appspot.com/o/review_form%2Freview_form.docx?alt=media&token=a1fc7c8f-b345-4f07-9f41-f60648a9597c'),
            child: Row(
              children: const [
                Text('Download form review',
                    style: TextStyle(color: Colors.green)),
                Icon(Icons.get_app, color: Colors.green),
              ],
            ))
        : Container();
  }
}
