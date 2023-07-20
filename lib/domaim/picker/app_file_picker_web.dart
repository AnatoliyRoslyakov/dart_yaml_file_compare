import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';


class AppFilePickerWeb {
  Future<(Uint8List?, String?, String?)> selectFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['yaml'],
      type: FileType.custom,
    );

    if (result != null) {
      final file = result.files.single;
      return (file.bytes, '', file.readStream.toString());
    } else {
      return (null, null, null);
    }
  }
}