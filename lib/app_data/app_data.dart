import 'lib/constants.dart';
import 'lib/toast.dart';

sealed class AppData {
  static const constants = Constants();
  static final toast = Toasts();
}
