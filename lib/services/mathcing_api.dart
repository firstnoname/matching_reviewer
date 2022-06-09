import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/based_api.dart';

class MatchingAPI extends BasedAPI {
  static const collectionName = "matching";
  static MatchingAPI? _cache;

  factory MatchingAPI() {
    _cache ??= MatchingAPI._();
    return _cache!;
  }

  MatchingAPI._() : super(collectionName: collectionName);

  Future<bool> addMatching(
      { User? reviewer,
       User? entrepreneur,
      required String category,
      required String subCategory}) async {
    Matching matching = Matching(
        entrepreneur: entrepreneur,
        reviewer: reviewer,
        productExpertiseCategory: category,
        productExpertiseSubCategory: subCategory);

    var response = await collection.add(matching.toMap());

    print('response -> $response');

    return false;
  }

  Future<List<Matching>> getMatchingList({required String userId}) async {
    var response = await collection
        .where('entrepreneur.id', isEqualTo: userId)
        .get()
        .catchError((error) {});
    List<Matching> _list = [];
    if (response.docs.isNotEmpty) {
      _list = response.docs
          .map((e) => Matching.fromMap(e.data()..addAll({'id': e.id})))
          .toList();
    }
    return _list;
  }
}
