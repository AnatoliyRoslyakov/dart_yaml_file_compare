import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'format_text_bloc.freezed.dart';

@freezed
class FormatTextEvent with _$FormatTextEvent {
  const FormatTextEvent._();

  const factory FormatTextEvent.switchFormat() = SwitchFormatTextEvent;

  const factory FormatTextEvent.value(
      String? file1, String? file2, String key) = ValueFormatTextEvent;
}

@freezed
class FormatTextState with _$FormatTextState {
  const FormatTextState._();

  const factory FormatTextState.initial(
    bool switchFormat,
    String key,
    (String, List<int>) value1,
    (String, List<int>) value2,
  ) = InitialFormatTextState;
}

class FormatTextBloc extends Bloc<FormatTextEvent, FormatTextState> {
  FormatTextBloc()
      : super(const FormatTextState.initial(
          false,
          '',
          ('', []),
          ('', []),
        )) {
    on<SwitchFormatTextEvent>(_switchFormat);
    on<ValueFormatTextEvent>(_value);
  }
  Future<void> _switchFormat(
      SwitchFormatTextEvent event, Emitter<FormatTextState> emit) async {
    bool switchFormat = state.switchFormat;
    emit(state.copyWith(switchFormat: !switchFormat));
  }

  Future<void> _value(
      ValueFormatTextEvent event, Emitter<FormatTextState> emit) async {
    List<String> value1 = event.file1!.split('\n');
    List<String> value2 = event.file2!.split('\n');

    Map fileMap1 = loadYaml(event.file1.toString());
    Map fileMap2 = loadYaml(event.file2.toString());

    List keyList1 = fileMap1.keys.toList();
    List keyList2 = fileMap2.keys.toList();

    int indexKey1 = keyList1.indexOf(event.key);
    int indexKey2 = keyList2.indexOf(event.key);

    String stopPattern1 =
        event.key == keyList1.last ? '( . Y . )' : keyList1[indexKey1 + 1];
    String stopPattern2 =
        event.key == keyList2.last ? '( . Y . )' : keyList2[indexKey2 + 1];

    (String, List<int>) getSelectedLines(
        List<String> value, String startPattern, String endPattern) {
      StringBuffer selectedLinesBuffer = StringBuffer();
      bool isInsideSelection = false;
      List<int> numStr = [];
      int indexStart = 0;
      int indexEnd = 1;

      for (var line in value) {
        if (line.startsWith(startPattern)) {
          indexStart = value.indexOf(line) + 2;
          isInsideSelection = true;
          continue; // Пропустить строку, содержащую startPattern
        }

        if (isInsideSelection) {
          if (line.startsWith(endPattern)) {
            isInsideSelection = false;
            indexEnd = value.indexOf(line);
            numStr = [for (var i = indexStart; i <= indexEnd; i++) i];
          } else {
            selectedLinesBuffer.writeln(line);
          }
        }
      }

      return (selectedLinesBuffer.toString(), numStr);
    }

    emit(state.copyWith(
        value1: getSelectedLines(value1, '${event.key}:', '$stopPattern1:'),
        value2: getSelectedLines(value2, '${event.key}:', '$stopPattern2:'),
        key: event.key));
  }
}
