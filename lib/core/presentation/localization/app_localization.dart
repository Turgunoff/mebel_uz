//
// @Author: "Eldor Turgunov"
// @Date: 08.03.2024
//

import 'package:get/get.dart';

import 'ru_ru/ru.dart';
import 'uz_uz/uz.dart';

class AppLocalization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'ru_RU': ruRU,
        'uz_UZ': uzUZ,
      };
}
