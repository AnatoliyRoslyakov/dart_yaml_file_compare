import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';


class AppFilePickerMobile {
  Future<(Uint8List?, String?, String?)> selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      
      type: FileType.any,
    );

    if (result != null) {
      final fileResult = result.files.single;
      final file = File(fileResult.path ?? '');
      final fileName = fileResult.name;

      return (file.readAsBytesSync(), fileName, file.readAsStringSync());
    } else {
      return (null, null, null);
    }
  }
}