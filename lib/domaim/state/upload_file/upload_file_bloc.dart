
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../picker/app_file_picker.dart';



part 'upload_file_bloc.freezed.dart';

@freezed
class UploadFileEvent with _$UploadFileEvent {
  const UploadFileEvent._();

    const factory UploadFileEvent.init() = InitUploadFileEvent;

  const factory UploadFileEvent.load1() = LoadUploadFileEvent1;

  const factory UploadFileEvent.init1() = InitUploadFileEvent1;

    const factory UploadFileEvent.load2() = LoadUploadFileEvent2;

  const factory UploadFileEvent.init2() = InitUploadFileEvent2;
}

@freezed
class UploadFileState with _$UploadFileState {
  const factory UploadFileState(
      {required UploadFileResult result1,
      required UploadFileResult result2,
      required String fileName1,
       required String fileName2,
      required String? file1,
      required String? file2}) = _UploadFileState;

  factory UploadFileState.initial() => const UploadFileState(
      result1: UploadFileResult.empty(), fileName1: '', file1: '', result2: UploadFileResult.empty(), fileName2: '', file2: '');
}

@freezed
class UploadFileResult with _$UploadFileResult {
  const UploadFileResult._();

  const factory UploadFileResult.empty() = EmptyUploadFileState;

  const factory UploadFileResult.loading() = LoadingUploadFileState;

  const factory UploadFileResult.success() = SuccessUploadFileState;

  const factory UploadFileResult.failure() = FailureUploadFileState;
}

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  UploadFileBloc() : super(UploadFileState.initial()) {
    on<LoadUploadFileEvent1>(_load1);
    on<InitUploadFileEvent>(_init);
    on<InitUploadFileEvent1>(_init1);
      on<LoadUploadFileEvent2>(_load2);
    on<InitUploadFileEvent2>(_init2);
  }
  Future<void> _load1(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    final result = await AppFilePicker.selectFile();

    if (result.$1 == null) {
      emit(state.copyWith(result1: const UploadFileResult.failure()));
      return;
    }
    emit(state.copyWith(result1: const UploadFileResult.loading()));

    if (result.$1 != null) {
      emit(state.copyWith(
          result1: const UploadFileResult.success(),
          fileName1: result.$2.toString(),
          file1: result.$3));
      return;
    } else {
      emit(state.copyWith(result1: const UploadFileResult.failure()));
    }
  }

  Future<void> _init1(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result1: const UploadFileResult.empty(), fileName1: '', file1: ''));
  }

  Future<void> _load2(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    final result = await AppFilePicker.selectFile();

    if (result.$1 == null) {
      emit(state.copyWith(result2: const UploadFileResult.failure()));
      return;
    }
    emit(state.copyWith(result2: const UploadFileResult.loading()));

    if (result.$1 != null) {
      emit(state.copyWith(
          result2: const UploadFileResult.success(),
          fileName2: result.$2.toString(),
          file2: result.$3));
      return;
    } else {
      emit(state.copyWith(result2: const UploadFileResult.failure()));
    }
  }

  Future<void> _init2(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result2: const UploadFileResult.empty(), fileName2: '', file2: ''));
  }

    Future<void> _init(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result2: const UploadFileResult.empty(), fileName2: '', file2: '', fileName1: '', file1: ''));
  }
}
