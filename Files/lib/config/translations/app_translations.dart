import 'package:get/get.dart';
import 'en.dart';
import 'fr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EnglishTranslations.translations,
        'fr_FR': FrenchTranslations.translations,
      };
}
