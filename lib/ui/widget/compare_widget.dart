import 'dart:async';

import 'package:app_yaml_compare/domaim/state/generate_format_text/format_text_bloc.dart';
import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:app_yaml_compare/domaim/state/generate_value/value_bloc.dart';
import 'package:app_yaml_compare/domaim/state/upload_file/upload_file_bloc.dart';
import 'package:app_yaml_compare/ui/theme/app_button.dart';
import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareWidget extends StatefulWidget {
  const CompareWidget({
    super.key,
    required this.screenSize,
    required this.state,
  });

  final UploadFileState state;
  final Size screenSize;

  @override
  State<CompareWidget> createState() => _CompareWidgetState();
}

class _CompareWidgetState extends State<CompareWidget> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSecond = Duration(seconds: 1);
    Timer.periodic(oneSecond, (Timer timer) {
      context.read<UploadFileBloc>().add(const UploadFileEvent.metaUpdate());
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20, left: 5),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context
                      .read<FormatTextBloc>()
                      .add(const SwitchFormatTextEvent());

                  context
                      .read<UploadFileBloc>()
                      .add(const FormatUploadFileEvent());
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.mainElement,
                          width: widget.state.format ? 4 : 1),
                      color: AppColors.secondaryElement),
                  width: (widget.screenSize.width * 0.2 - 15) / 2,
                  height: 45,
                  child: const Padding(
                    padding: EdgeInsets.all(9.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.library_books,
                          color: AppColors.mainElement,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'Format',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainText),
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              BlocListener<UploadFileBloc, UploadFileState>(
                  listener: (context, state) {
                    context
                        .read<UploadFileBloc>()
                        .add(const UploadFileEvent.update());
                  },
                  child: InkWell(
                    onTap: () {
                      var stateFile =
                          BlocProvider.of<UploadFileBloc>(context).state;
                      debugPrint(stateFile.file2?.substring(10, 74));

                      context.read<KeyListBloc>().add(CreateKeyListEvent(
                          stateFile.file1!, stateFile.file2!));

                      var stateList =
                          BlocProvider.of<KeyListBloc>(context).state;
                      debugPrint(stateFile.file2?.substring(0, 74));
                      context
                          .read<KeyListBloc>()
                          .add(KeyListEvent.press(stateList.index));

                      context.read<ValueBloc>().add(ValueEvent.create(
                          stateFile.file1!,
                          stateFile.file2!,
                          stateList.keyList[stateList.index]));
                      context.read<FormatTextBloc>().add(FormatTextEvent.value(
                          stateFile.file1!,
                          stateFile.file2!,
                          stateList.keyList[stateList.index]));
                    },
                    child: BlocListener<UploadFileBloc, UploadFileState>(
                        listener: (context, state) {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.mainElement, width: 1),
                              color: widget.state.update
                                  ? AppColors.red
                                  : AppColors.secondaryElement),
                          width: (widget.screenSize.width * 0.2 - 15) / 2,
                          height: 45,
                          child: const Padding(
                            padding: EdgeInsets.all(9.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.refresh,
                                  color: AppColors.mainElement,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.mainText),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ))
            ],
          ),
        ),
        AppButton(
            onPressed: () {
              context.read<UploadFileBloc>().add(const UploadFileEvent.init1());
              context.read<KeyListBloc>().add(const CreateKeyListEvent('', ''));
            },
            overlayColor: const Color.fromARGB(255, 246, 126, 118),
            backgroundColor: AppColors.secondaryElement,
            borderColor: AppColors.mainElement,
            child: Row(
              children: [
                Text(
                  widget.state.fileName1,
                  style: const TextStyle(color: AppColors.mainElement),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                )
              ],
            )),
        const SizedBox(
          width: 20,
        ),
        AppButton(
            onPressed: () {
              context.read<UploadFileBloc>().add(const UploadFileEvent.init2());
              context.read<KeyListBloc>().add(const CreateKeyListEvent('', ''));
            },
            overlayColor: const Color.fromARGB(255, 246, 126, 118),
            backgroundColor: AppColors.secondaryElement,
            borderColor: AppColors.mainElement,
            child: Row(
              children: [
                Text(
                  widget.state.fileName2,
                  style: const TextStyle(color: AppColors.mainElement),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.delete_rounded,
                  color: Colors.red,
                )
              ],
            ))
      ],
    );
  }
}
