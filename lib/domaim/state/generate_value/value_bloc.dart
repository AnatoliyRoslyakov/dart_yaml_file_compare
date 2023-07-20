import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

import '../../map_to_yaml.dart';
part 'value_bloc.freezed.dart';

@freezed
class ValueEvent with _$ValueEvent {
 const ValueEvent._();

 const factory ValueEvent.create(String file1, String file2, String keyIndex, bool switchColor) = CreateValueEvent;


}

@freezed
class ValueState with _$ValueState {
 const ValueState._();

 const factory ValueState.initial(List<String> lines1, List<String> lines2, List<Color> colorList1, List<Color> colorList2, String value1, String value2, bool switchColor, String keyIndex) = InitialValueState;
}

class ValueBloc extends Bloc<ValueEvent, ValueState> {
 ValueBloc() : super( const ValueState.initial([],[],[], [], '', '', false, '')){
 on<CreateValueEvent>(_create); 
}

 Future<void> _create(CreateValueEvent event, Emitter<ValueState> emit) async {
  Map fileMap1 = loadYaml(event.file1.toString());
  Map fileMap2 = loadYaml(event.file2.toString());
  var value1 = fileMap1[event.keyIndex];
   var value2 = fileMap2[event.keyIndex];

final writer = YamlWriter();
final String str1 = writer.write(value1);
final String str2 = writer.write(value2);

List<String> lines1 = str1.split('\n');
List<String> lines2 = str2.split('\n');

List<Color> colorList1 = [];
List<Color> colorList2 = [];

if(!event.switchColor){
  for(var it in lines1){
    if(lines2.contains(it)){
      colorList1.add(const Color.fromARGB(0, 0, 0, 0));
    } else{colorList1.add(AppColors.orange);}
  }
    for(var it in lines2){
    if(lines1.contains(it)){
      colorList2.add(const Color.fromARGB(0, 0, 0, 0));
    } else{colorList2.add(AppColors.orange);}
  }
  emit(state.copyWith(lines1: lines1, lines2: lines2, colorList1: colorList1, colorList2: colorList2, switchColor: true, keyIndex: event.keyIndex));
  return;
}


emit(state.copyWith(value1: writer.write({event.keyIndex:value1}), value2: writer.write({event.keyIndex:value2}), switchColor: false));
 }


}