import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../picker/app_file_picker.dart';

part 'upload_file_bloc.freezed.dart';

@freezed
class UploadFileEvent with _$UploadFileEvent {
  const UploadFileEvent._();

  const factory UploadFileEvent.init() = InitUploadFileEvent;

  const factory UploadFileEvent.load1({XFile? file1}) = LoadUploadFileEvent1;

  const factory UploadFileEvent.init1() = InitUploadFileEvent1;

  const factory UploadFileEvent.load2({XFile? file2}) = LoadUploadFileEvent2;

  const factory UploadFileEvent.init2() = InitUploadFileEvent2;

  const factory UploadFileEvent.success() = SuccessUploadFileEvent;

  const factory UploadFileEvent.format() = FormatUploadFileEvent;

  const factory UploadFileEvent.update() = UpdateUploadFileEvent;

  const factory UploadFileEvent.metaUpdate({bool? update}) = MetaUpdateUploadFileEvent;
}

@freezed
class UploadFileState with _$UploadFileState {
  const factory UploadFileState(
      {required UploadFileResult result1,
      required UploadFileResult result2,
      required String fileName1,
      required String fileName2,
      required String? file1,
      required String? file2,
      required String? filePath1,
      required String? filePath2,
      required bool success,
      required bool format,
      required bool update}) = _UploadFileState;

  factory UploadFileState.initial() => const UploadFileState(
      result1: UploadFileResult.empty(),
      fileName1: '',
      file1: '',
      filePath1: '',
      result2: UploadFileResult.empty(),
      fileName2: '',
      file2: '',
      filePath2: '',
      success: false,
      format: false,
      update: false);
}

@freezed
class UploadFileResult with _$UploadFileResult {
  const UploadFileResult._();

  const factory UploadFileResult.empty() = EmptyUploadFileState;

  const factory UploadFileResult.loading() = LoadingUploadFileState;

  const factory UploadFileResult.success() = SuccessUploadFileState;

  const factory UploadFileResult.successContent() =
      SuccessContentUploadFileState;

  const factory UploadFileResult.failure() = FailureUploadFileState;
}

class UploadFileBloc extends Bloc<UploadFileEvent, UploadFileState> {
  UploadFileBloc() : super(UploadFileState.initial()) {
    on<LoadUploadFileEvent1>(_load1);
    on<InitUploadFileEvent>(_init);
    on<InitUploadFileEvent1>(_init1);
    on<LoadUploadFileEvent2>(_load2);
    on<InitUploadFileEvent2>(_init2);
    on<SuccessUploadFileEvent>(_success);
    on<FormatUploadFileEvent>(_format);
    on<UpdateUploadFileEvent>(_update);
    on<MetaUpdateUploadFileEvent>(_metaUpdate);
  }
   // разобраться с множественными проверками на null
  Future<void> _load1(
      LoadUploadFileEvent1 event, Emitter<UploadFileState> emit) async {
    if (event.file1 == null) {
      final result = await AppFilePicker.selectFile();

      if (result.$3 == null) {
        emit(state.copyWith(result1: const UploadFileResult.failure()));
        return;
      }
      emit(state.copyWith(result1: const UploadFileResult.loading()));

      if (result.$1 != null) {
        emit(state.copyWith(
            result1: const UploadFileResult.success(),
            fileName1: result.$2.toString(),
            file1: result.$3,
            filePath1: result.$4));
        return;
      } else {
        emit(state.copyWith(result1: const UploadFileResult.failure()));
      }
    }
    if (event.file1 == null) {
      emit(state.copyWith(result1: const UploadFileResult.failure()));
      return;
    }
    emit(state.copyWith(result1: const UploadFileResult.loading()));

    if (event.file1 != null) {
      File convertToFile(XFile xFile) => File(xFile.path);
      String? file1 =  convertToFile(event.file1!).readAsStringSync();
      emit(state.copyWith(
          result1: const UploadFileResult.success(),
          fileName1: event.file1!.name,
          file1: file1,
          filePath1: event.file1!.path));
      return;
    } else {
      emit(state.copyWith(result1: const UploadFileResult.failure()));
    }
  }

  Future<void> _init1(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result1: const UploadFileResult.empty(),
        fileName1: '',
        file1: '',
        success: false));
  }
 // разобраться с множественными проверками на null
  Future<void> _load2(
      LoadUploadFileEvent2 event, Emitter<UploadFileState> emit) async {
    if (event.file2 == null) {
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
          file2: result.$3,
          filePath2: result.$4));
      return;
    } else {
      emit(state.copyWith(result2: const UploadFileResult.failure()));
    }
         }
     if (event.file2 == null) {
      emit(state.copyWith(result2: const UploadFileResult.failure()));   
      return;
    }
    emit(state.copyWith(result2: const UploadFileResult.loading()));

    if (event.file2 != null) {
      File convertToFile(XFile xFile) => File(xFile.path);
     String? file2 = convertToFile(event.file2!).readAsStringSync();
      emit(state.copyWith(
          result2: const UploadFileResult.success(),
          fileName2: event.file2!.name,
          file2: file2,
          filePath2: event.file2!.path));
      return;
    } else {
      emit(state.copyWith(result2: const UploadFileResult.failure()));
    }    
  }

  Future<void> _init2(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result2: const UploadFileResult.empty(),
        fileName2: '',
        file2: '',
        success: false));
  }

  Future<void> _init(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(
        result2: const UploadFileResult.empty(),
        fileName2: '',
        file2: '',
        fileName1: '',
        file1: '',
        success: false));
  }

  Future<void> _success(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(success: true));
  }

  Future<void> _format(
      UploadFileEvent event, Emitter<UploadFileState> emit) async {
    emit(state.copyWith(format: !state.format));
  }

   Future<void> _update(
  UpdateUploadFileEvent event, Emitter<UploadFileState> emit) async {
  String file1 =   File(state.filePath1.toString()).readAsStringSync();
  String file2 =   File(state.filePath2.toString()).readAsStringSync();
  
    emit(state.copyWith(file1: file1, file2: file2));
  }

    Future<void> _metaUpdate(
  MetaUpdateUploadFileEvent event, Emitter<UploadFileState> emit) async {

    
  String file1 =   File(state.filePath1.toString()).readAsStringSync();
  String file2 =   File(state.filePath2.toString()).readAsStringSync();
  
if(file1 != state.file1 || file2 != state.file2){
   
    emit(state.copyWith(update: true));
     return;
  }
  emit(state.copyWith(update: event.update!)); 
 
  } 
}
