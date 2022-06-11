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

  Future<bool> addMatching({required Matching matchingInfo}) async {
    var response = await collection.add(matchingInfo.toMap()).catchError((e) {
      print('add matching info failure. code -> $e');
    }).then((value) {
      return true;
    });

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
