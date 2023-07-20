import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';
import 'package:flutter/foundation.dart';

part 'key_list_bloc.freezed.dart';

@freezed
class KeyListEvent with _$KeyListEvent {
  const KeyListEvent._();

  const factory KeyListEvent.create(String file1, String file2) =
      CreateKeyListEvent;

  const factory KeyListEvent.press(int index) =
      PressKeyListEvent;
}

@freezed
class KeyListState with _$KeyListState {
  const KeyListState._();

  const factory KeyListState.initial(
      List keyList, List colorList, String title, List newColorList) = InitialKeyListState;
}

class KeyListBloc extends Bloc<KeyListEvent, KeyListState> {
  KeyListBloc() : super(const KeyListState.initial([], [], '', [])) {
    on<CreateKeyListEvent>(_create);
    on<PressKeyListEvent>(_press);
  }
  Future<void> _create(
      CreateKeyListEvent event, Emitter<KeyListState> emit) async {
    if (event.file1.isEmpty || event.file2.isEmpty) {
      emit(state.copyWith(title: 'data clear', keyList: [], colorList: []));
      return;
    }

    try {
      loadYaml(event.file1.toString());
      loadYaml(event.file2.toString());
    } catch (e) {
      emit(state.copyWith(title: e.toString(), keyList: [], colorList: []));
    }
    Map fileMap1 = loadYaml(event.file1.toString());
    Map fileMap2 = loadYaml(event.file2.toString());

    List keyList1 = fileMap1.keys.toList();
    List keyList2 = fileMap2.keys.toList();
    List totalKeyList = (keyList1 + keyList2).toSet().toList();

    List baseLIstKey = [];
    List baseLIstColor = [];

    if (keyList1.length < 2 || keyList2.length < 2) {
      emit(
        state.copyWith(
            title: 'one of the files is shit', keyList: [], colorList: []),
      );
      return;
    }

    if (mapEquals(fileMap1, fileMap2)) {
      emit(state.copyWith(
          title: 'identical files', keyList: keyList1, colorList: []));
      return;
    }

    if (!mapEquals(fileMap1, fileMap2)) {
      for (var it in totalKeyList) {
        if (keyList2.contains(it) && keyList1.contains(it)) {
          baseLIstKey.add(it);
          if (fileMap1[it].toString() == fileMap2[it].toString()) {
            baseLIstColor.add(AppColors.white);
          }
          if (fileMap1[it].toString() != fileMap2[it].toString()) {
            baseLIstColor.add(AppColors.orange);
          }
        } else {
          baseLIstKey.add(it);
          baseLIstColor.add(AppColors.red);
        }
      }
      emit(
        state.copyWith(keyList: baseLIstKey, colorList: baseLIstColor, newColorList: baseLIstColor),
      );
    } else {}
  }

  Future<void> _press(
      PressKeyListEvent event, Emitter<KeyListState> emit) async {
      List newListColor=List.from(state.colorList);
      newListColor[event.index] = AppColors.mainElement;
        emit(state.copyWith(newColorList: newListColor));
      }
}
