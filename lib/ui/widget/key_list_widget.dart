import 'package:app_yaml_compare/ui/widget/value_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domaim/state/generate_key_list/key_list_bloc.dart';
import '../../domaim/state/generate_value/value_bloc.dart';
import '../theme/app_colors.dart';

class KeyListWidget extends StatelessWidget {
  final String file1;
  final String file2;
  const KeyListWidget({
    super.key,
    required this.file1,
    required this.file2,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KeyListBloc, KeyListState>(builder: (context, state) {
      final yourScrollController = ScrollController();
      return state.keyList.isNotEmpty
          ? Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      // height: 100,
                      width: 250,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Scrollbar(
                        thumbVisibility: true,
                        thickness: 10,
                        controller: yourScrollController,
                        radius: const Radius.circular(5),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: ListView.builder(
                              controller: yourScrollController,
                              itemCount: state.keyList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      context.read<ValueBloc>().add(
                                          ValueEvent.create(file1, file2,
                                              state.keyList[index]));
                                      context
                                          .read<KeyListBloc>()
                                          .add(KeyListEvent.press(index));
                                    },
                                    child: Container(
                                      height: 40,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              color: AppColors.mainElement),
                                          color: state.newColorList[index]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Text(
                                          state.keyList[index],
                                          style: TextStyle(
                                              color:
                                                  state.newColorList[index] ==
                                                          AppColors.mainElement
                                                      ? AppColors.white
                                                      : AppColors.mainText,
                                              fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ),
                    const ValueWidget(),
                  ],
                ),
              ),
            )
          : SizedBox(
              child: Text(
                state.title,
                style: const TextStyle(
                    color: AppColors.mainElement, fontWeight: FontWeight.w300),
              ),
            );
    });
  }
}

