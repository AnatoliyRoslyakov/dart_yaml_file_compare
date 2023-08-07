import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'format_text_bloc.freezed.dart';

@freezed
class FormatTextEvent with _$FormatTextEvent {
 const FormatTextEvent._();

 const factory FormatTextEvent.switchFormat() = SwitchFormatTextEvent;

 const factory FormatTextEvent.value(String? file1, String? file2, String key) = ValueFormatTextEvent;
}

@freezed
class FormatTextState with _$FormatTextState {
 const FormatTextState._();

 const factory FormatTextState.initial(bool switchFormat, String key, String value1, String value2) = InitialFormatTextState;


}

class FormatTextBloc extends Bloc<FormatTextEvent, FormatTextState> {
 FormatTextBloc() : super(const FormatTextState.initial(false, '', '', '',)){
 on<SwitchFormatTextEvent>(_switchFormat); 
 on<ValueFormatTextEvent>(_value); 
}
 Future<void> _switchFormat(SwitchFormatTextEvent event, Emitter<FormatTextState> emit) async {
  bool switchFormat = state.switchFormat;
  emit(state.copyWith(switchFormat: !switchFormat));
 }

 Future<void> _value(ValueFormatTextEvent event, Emitter<FormatTextState> emit) async {
  // ...
 }
}