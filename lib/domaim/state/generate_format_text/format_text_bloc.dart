import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
          bool switchFormat, String key, String value1, String value2) =
      InitialFormatTextState;
}

class FormatTextBloc extends Bloc<FormatTextEvent, FormatTextState> {
  FormatTextBloc()
      : super(const FormatTextState.initial(
          false,
          '',
          '',
          '',
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
//  print(value1);
    List<String> value2 = event.file2!.split('\n');

    String getSelectedLines(
        List<String> value, String startPattern, String endPattern) {
      StringBuffer selectedLinesBuffer = StringBuffer();
      bool isInsideSelection = false;

      for (var line in value) {
        if (line.contains(startPattern)) {
          isInsideSelection = true;
        }

        if (isInsideSelection) {
          selectedLinesBuffer.writeln(line);
        }

        if (line.contains(endPattern)) {
          isInsideSelection = false;
        }
      }

      return selectedLinesBuffer.toString();
    }

    emit(state.copyWith(
        value1: getSelectedLines(value1, '${event.key}:', '\n '),
        value2: getSelectedLines(value2, '${event.key}:', '\n '),
        key: event.key));
  }
}
