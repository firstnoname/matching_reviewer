import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/models.dart';

class ProductsCardList extends StatelessWidget {
  final List<Matching> products;
  final Function? onSubmit;
  final Function? onDecline;
  final Function? onUploadReviewForm;

  const ProductsCardList(
      {Key? key,
      required this.products,
      this.onSubmit,
      this.onDecline,
      this.onUploadReviewForm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (context, index) => Card(
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
                            products[index].product?.pictures?.first,
                            fit: BoxFit.contain),
                      ))
                  : const SizedBox(
                      width: 10,
                      height: 10,
                    ),
              title: Text(products[index].product?.productName ?? ''),
              subtitle: Text(products[index].product?.conditions ?? ''),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Details'),
                  onPressed: () =>
                      _productDetail(context, productDetail: products[index]),
                ),
                const SizedBox(width: 8),
                TextButton(
                    onPressed: () => launchUrlString(
                        'https://firebasestorage.googleapis.com/v0/b/matching-reviewer.appspot.com/o/review_form%2Freview_form.docx?alt=media&token=a1fc7c8f-b345-4f07-9f41-f60648a9597c'),
                    child: Row(
                      children: const [
                        Text('Download form review',
                            style: TextStyle(color: Colors.green)),
                        Icon(Icons.get_app, color: Colors.green),
                      ],
                    )),
                onUploadReviewForm == null
                    ? Container()
                    : TextButton(
                        child: Row(
                          children: const [
                            Text(
                              'Upload reviewed form',
                              style: TextStyle(color: Colors.amber),
                            ),
                            Icon(Icons.upload_file, color: Colors.amber)
                          ],
                        ),
                        onPressed: () async {
                          var pickedFile =
                              await FilePickerWeb.platform.pickFiles();
                          if (pickedFile != null) {
                            return _uploadDialog(context,
                                title: 'ยืนยันการอัพโหลดฟอร์ม',
                                matchingID: products[index].id!,
                                pickedFile: pickedFile,
                                uploadFunc: onUploadReviewForm!);
                          }
                        },
                      ),
                onSubmit == null
                    ? Container()
                    : TextButton(
                        child: Row(
                          children: const [
                            Text(
                              'ตกลง',
                              style: TextStyle(color: Colors.green),
                            ),
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          ],
                        ),
                        onPressed: () => _confirmDialog(context,
                            title: '', confirm: onSubmit!),
                      ),
                onSubmit == null
                    ? Container()
                    : TextButton(
                        child: Row(
                          children: const [
                            Text(
                              'ยกเลิก',
                              style: TextStyle(color: Colors.red),
                            ),
                            Icon(
                              Icons.close,
                              color: Colors.red,
                            )
                          ],
                        ),
                        onPressed: () => _confirmDialog(context,
                            title: '', confirm: onDecline!),
                      ),
              ],
            ),
          ],
        ),
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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(title),
                    ),
                  ),
                  Text('${pickedFile.names.single}'),
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
      {required String title, required Function confirm}) {
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
                  child: Text(title),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () => confirm,
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
}
