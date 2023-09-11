import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

import '../../map_to_yaml.dart';
part 'value_bloc.freezed.dart';

@freezed
class ValueEvent with _$ValueEvent {
  const ValueEvent._();

  const factory ValueEvent.create(String file1, String file2, String keyIndex) =
      CreateValueEvent;
}

@freezed
class ValueState with _$ValueState {
  const ValueState._();

  const factory ValueState.initial(
      List<String> lines1,
      List<String> lines2,
      List<Color> colorList1,
      List<Color> colorList2,
      String value1,
      String value2,
      String keyIndex) = InitialValueState;
}

class ValueBloc extends Bloc<ValueEvent, ValueState> {
  ValueBloc() : super(const ValueState.initial([], [], [], [], '', '', '')) {
    on<CreateValueEvent>(_create);
  }

  Future<void> _create(CreateValueEvent event, Emitter<ValueState> emit) async {
    Map fileMap1 = loadYaml(event.file1) ?? {};
    Map fileMap2 = loadYaml(event.file2) ?? {};

    var value1 = fileMap1[event.keyIndex];
    var value2 = fileMap2[event.keyIndex];

    final writer = YamlWriter();
    final String str1 = writer.write(value1);
    final String str2 = writer.write(value2);

    List<String> lines1 = str1.split('\n\n');
    List<String> lines2 = str2.split('\n\n');

    List<Color> colorList1 = [];
    List<Color> colorList2 = [];

    if (lines1.length != lines2.length) {
      List<String> lines1 = str1.split('\n');
      List<String> lines2 = str2.split('\n');

      for (var it in lines1) {
        if (lines2.contains(it) || lines1.indexOf(it) == lines2.indexOf(it)) {
          colorList1.add(AppColors.trans);
        } else {
          colorList1.add(AppColors.orange);
        }
      }
      for (var it in lines2) {
        if (lines1.contains(it) || lines1.indexOf(it) == lines2.indexOf(it)) {
          colorList2.add(AppColors.trans);
        } else {
          colorList2.add(AppColors.orange);
        }
      }
    } else {
      for (int i = 0; i < lines1.length; i++) {
        for (var it in lines1[i].split('\n')) {
          if (lines2[i].split('\n').contains(it)) {
            colorList1.add(AppColors.trans);
          } else {
            colorList1.add(AppColors.orange);
          }
        }
        colorList1.add(AppColors.trans);
      }
      for (int i = 0; i < lines2.length; i++) {
        for (var it in lines2[i].split('\n')) {
          if (lines1[i].split('\n').contains(it)) {
            colorList2.add(AppColors.trans);
          } else {
            colorList2.add(AppColors.orange);
          }
        }
        colorList2.add(AppColors.trans);
      }
    }

    List<String> lines11 = str1.split('\n');
    List<String> lines22 = str2.split('\n');
    emit(state.copyWith(
        value1: event.keyIndex,
        lines1: lines11,
        lines2: lines22,
        colorList1: colorList1,
        colorList2: colorList2,
        keyIndex: event.keyIndex));
    return;
  }
}
