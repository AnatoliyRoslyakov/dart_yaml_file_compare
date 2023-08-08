import 'package:app_yaml_compare/domaim/picker/app_file_picker_mobile.dart';
import 'package:app_yaml_compare/domaim/picker/app_file_picker_web.dart';
import 'package:flutter/foundation.dart';

class AppFilePicker {
  AppFilePicker._();

  static Future<(List?, String?, String?)> selectFile() {
    if (kIsWeb) return AppFilePickerWeb().selectFile();

    return AppFilePickerMobile().selectFile();
  }
}
