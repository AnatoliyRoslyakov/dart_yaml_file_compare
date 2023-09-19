import 'package:app_yaml_compare/domaim/state/generate_format_text/format_text_bloc.dart';
import 'package:app_yaml_compare/domaim/state/upload_file/upload_file_bloc.dart';
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
      final Size screenSize = MediaQuery.of(context).size;
      final yourScrollController = ScrollController();
      return state.keyList.isNotEmpty
          ? Expanded(
              child: Row(
                children: [
                  Container(
                    // height: 100,
                    width: screenSize.width * 0.2,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0.0),
                      child: ListView.builder(
                          controller: yourScrollController,
                          itemCount: state.keyList.length,
                          itemBuilder: (context, index) {
                            return BlocBuilder<FormatTextBloc, FormatTextState>(
                                builder: (context, stateFormat) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: InkWell(
                                  onTap: () {
                                    context.read<FormatTextBloc>().add(
                                        FormatTextEvent.value(file1, file2,
                                            state.keyList[index]));

                                    context.read<ValueBloc>().add(
                                        ValueEvent.create(file1, file2,
                                            state.keyList[index]));

                                    context
                                        .read<KeyListBloc>()
                                        .add(KeyListEvent.press(index));
                                  },
                                  child: Container(
                                    height: 45,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors.mainElement,
                                            width: state.newColorList[index] ==
                                                    AppColors.mainElement
                                                ? 4
                                                : 1),
                                        color: state.colorList[index]),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(9.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                state.keyList[index],
                                                style: const TextStyle(
                                                    color: AppColors.mainText,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            if (state.newColorList[index] ==
                                                AppColors.mainElement)
                                              InkWell(
                                                child: const Icon(
                                                  Icons.refresh,
                                                  color: AppColors.mainElement,
                                                ),
                                                onTap: () async {
                                                  context
                                                      .read<UploadFileBloc>()
                                                      .add(const UploadFileEvent
                                                          .update());

                                                  context
                                                      .read<FormatTextBloc>()
                                                      .add(
                                                          FormatTextEvent.value(
                                                              file1,
                                                              file2,
                                                              state.keyList[
                                                                  index]));

                                                  context.read<ValueBloc>().add(
                                                      ValueEvent.create(
                                                          file1,
                                                          file2,
                                                          state
                                                              .keyList[index]));

                                                  context
                                                      .read<KeyListBloc>()
                                                      .add(KeyListEvent.press(
                                                          index));
                                                  context
                                                      .read<KeyListBloc>()
                                                      .add(CreateKeyListEvent(
                                                          file1, file2));
                                                },
                                              )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            });
                          }),
                    ),
                  ),
                  BlocListener<UploadFileBloc, UploadFileState>(
                    listener: (context, state) {
                      context
                          .read<KeyListBloc>()
                          .add(CreateKeyListEvent(state.file1!, state.file2!));
                    },
                    child: const ValueWidget(),
                  ),
                ],
              ),
            )
          : SizedBox(
              child: Text(
                state.title,
                style: TextStyle(
                    color: state.title == 'Add a second file'
                        ? AppColors.mainElement
                        : Colors.red,
                    fontWeight: FontWeight.w300),
              ),
            );
    });
  }
}
