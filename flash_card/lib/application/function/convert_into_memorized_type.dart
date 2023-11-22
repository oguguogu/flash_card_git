import 'package:flash_card/presentation/widgets/in_flashcard/coponents/colorful_check_marks.dart';

MemorizedType? convertIntToMemorizedType(int? type) {
  switch (type) {
    case 1:
      return MemorizedType.red;
    case 2:
      return MemorizedType.yellow;
    case 3:
      return MemorizedType.blue;
    default:
      return null;
  }
}
