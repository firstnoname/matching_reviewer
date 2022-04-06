import 'package:matching_reviewer/models/models.dart';
import 'package:matching_reviewer/services/services.dart';

class QuestionnaireAPI extends BasedAPI {
  static const collectionName = 'questionnaire_template';

  QuestionnaireAPI() : super(collectionName: collectionName);

  Future<bool> testAddData() async {
    Questionnaire questionnaire = Questionnaire(
      questions: [
        Question(
          number: 0,
          question: 'Food',
          answers: [
            Answer(number: 0, answer: 'Fresh food', isSelected: false),
            Answer(number: 1, answer: 'Processed food', isSelected: false),
          ],
        ),
        Question(
          number: 1,
          question: 'Cosumetics',
          answers: [
            Answer(number: 0, answer: 'Hair cosmetics', isSelected: false),
            Answer(number: 1, answer: 'Face cosmetics', isSelected: false),
            Answer(number: 2, answer: 'Body cosmetics', isSelected: false),
            Answer(number: 3, answer: 'Fragrances', isSelected: false),
            Answer(
                number: 4,
                answer: 'Miscellaneous cosmetics',
                isSelected: false),
            Answer(number: 5, answer: 'Other', isSelected: false),
          ],
        ),
        Question(
          number: 2,
          question: 'Clothes',
          answers: [
            Answer(number: 0, answer: 'Shirt, Blouse', isSelected: false),
            Answer(
                number: 1,
                answer: 'Trousers, Pants, T-shirt, Jacket',
                isSelected: false),
            Answer(number: 2, answer: 'Cap, Hat', isSelected: false),
            Answer(number: 3, answer: 'Scarf', isSelected: false),
            Answer(number: 4, answer: 'Skirt', isSelected: false),
            Answer(
                number: 5, answer: 'Shoes, Boot, Sneakers', isSelected: false),
            Answer(number: 6, answer: 'Belt', isSelected: false),
            Answer(number: 7, answer: 'Accessory', isSelected: false),
            Answer(number: 8, answer: 'Bag, Handbag, Purse', isSelected: false),
            Answer(number: 9, answer: 'Other', isSelected: false),
          ],
        ),
        Question(
          number: 3,
          question: 'Cosumetics',
          answers: [
            Answer(
                number: 0,
                answer: 'Accommodation (Hotel, Resort, Hostel, House stay',
                isSelected: false),
            Answer(number: 1, answer: 'Restaurants', isSelected: false),
            Answer(number: 2, answer: 'Cafe', isSelected: false),
            Answer(number: 3, answer: 'Other', isSelected: false),
          ],
        ),
      ],
      questionType: 'product_expertise',
    );
    await collection
        .doc('kWujwX8u5vkaiKhxlVTr')
        .update(questionnaire.toMap())
        .catchError((error) {
      print('add data failure -> ${error.toString()}');
    });
    return false;
  }

  Future<Questionnaire?> getQuestionnaire(String questionnaireType) async {
    var response =
        await collection.where('field', isEqualTo: questionnaireType).get();

    return null;
  }
}
