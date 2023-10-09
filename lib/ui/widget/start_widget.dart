import 'dart:async';

import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:app_yaml_compare/domaim/state/upload_file/upload_file_bloc.dart';
import 'package:app_yaml_compare/ui/theme/app_button.dart';
import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:cross_file/cross_file.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartWidget extends StatelessWidget {
  const StartWidget({
    super.key,
    required this.state,
  });
  final UploadFileState state;

  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        Row(children: [
          if (state.result1 is EmptyUploadFileState)
            AppButton(
                onPressed: () {
                  context
                      .read<UploadFileBloc>()
                      .add(const UploadFileEvent.load1());
                },
                child: const Text('Add conf-1'))
          else if (state.result1 is LoadingUploadFileState)
            AppButton(
                onPressed: () {},
                child: const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                ))
          else if (state.result1 is SuccessUploadFileState)
            AppButton(
              onPressed: () {
                context
                    .read<UploadFileBloc>()
                    .add(const UploadFileEvent.init1());
                context
                    .read<KeyListBloc>()
                    .add(const CreateKeyListEvent('', ''));
              },
              overlayColor: const Color.fromARGB(255, 246, 126, 118),
              backgroundColor: AppColors.secondaryElement,
              borderColor: AppColors.mainElement,
              child: Row(
                children: [
                  Text(
                    state.fileName1,
                    style: const TextStyle(color: AppColors.mainElement),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Icon(
                    Icons.delete_rounded,
                    color: Colors.red,
                  )
                ],
              ),
            )
          else
            AppButton(
                onPressed: () {
                  context
                      .read<UploadFileBloc>()
                      .add(const UploadFileEvent.load1());
                },
                child: const Text('Select file')),
          if (state.result1 is SuccessUploadFileState &&
              state.result2 is SuccessUploadFileState &&
              state.fileName1.split('.').last == 'yaml' &&
              state.fileName2.split('.').last == 'yaml')
            SizedBox(
              width: 55,
              child: AppButton(
                  onPressed: () {
                    context
                        .read<UploadFileBloc>()
                        .add(const SuccessUploadFileEvent());
                    context
                        .read<KeyListBloc>()
                        .add(CreateKeyListEvent(state.file1!, state.file2!));

                      
                  },
                  child: const Text('GO')),
            )
          else
            SizedBox(
              width: 55,
              child: AppButton(
                  onPressed: () {},
                  borderColor: AppColors.mainElement,
                  backgroundColor: AppColors.secondaryElement,
                  overlayColor: const Color.fromARGB(255, 246, 126, 118),
                  child: const Icon(
                    Icons.info_outline,
                    color: AppColors.mainElement,
                  )),
            ),
          if (state.result2 is EmptyUploadFileState)
            AppButton(
                onPressed: () {
                  context
                      .read<UploadFileBloc>()
                      .add(const UploadFileEvent.load2());
                },
                child: const Text('Add conf-2'))
          else if (state.result2 is LoadingUploadFileState)
            AppButton(
                onPressed: () {},
                child: const Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      )),
                ))
          else if (state.result2 is SuccessUploadFileState)
            AppButton(
                onPressed: () {
                  context
                      .read<UploadFileBloc>()
                      .add(const UploadFileEvent.init2());
                  context
                      .read<KeyListBloc>()
                      .add(const CreateKeyListEvent('', ''));
                },
                overlayColor: const Color.fromARGB(255, 246, 126, 118),
                backgroundColor: AppColors.secondaryElement,
                borderColor: AppColors.mainElement,
                child: Row(
                  children: [
                    Text(
                      state.fileName2,
                      style: const TextStyle(color: AppColors.mainElement),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(
                      Icons.delete_rounded,
                      color: Colors.red,
                    )
                  ],
                ))
          else
            AppButton(
                onPressed: () {
                  context
                      .read<UploadFileBloc>()
                      .add(const UploadFileEvent.load2());
                },
                child: const Text('Select file')),
        ]),
        const SizedBox(
          height: 10,
        ),
        DropDesctopWidget(
          state: state,
        ),
      ],
    );
  }
}

class DropDesctopWidget extends StatelessWidget {
  const DropDesctopWidget({
    required this.state,
    super.key,
  });

  final UploadFileState state;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final List<XFile> list = [];
    return DropTarget(
      onDragDone: (detail) async {
        list.addAll(detail.files);
        if (list.length == 2) {
          context
              .read<UploadFileBloc>()
              .add(UploadFileEvent.load1(file1: list.first));
          context
              .read<UploadFileBloc>()
              .add(UploadFileEvent.load2(file2: list.last));
        }
        if (list.length > 2) {
          return;
        }

        if (state.file1 == '') {
          context
              .read<UploadFileBloc>()
              .add(UploadFileEvent.load1(file1: list.first));
        }
        if (state.file2 == '' && state.file1 != '') {
          context
              .read<UploadFileBloc>()
              .add(UploadFileEvent.load2(file2: list.first));
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              state.result1 == const UploadFileResult.success()
                  ? Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.mainElement,
                        ),
                        SelectableText(
                          state.filePath1.toString(),
                          style: const TextStyle(color: AppColors.mainText),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 20,
                    ),
              state.result2 == const UploadFileResult.success()
                  ? Row(
                      children: [
                        const Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.mainElement,
                        ),
                        SelectableText(
                          state.filePath2.toString(),
                          style: const TextStyle(color: AppColors.mainText),
                        ),
                      ],
                    )
                  : const SizedBox(
                      height: 20,
                    ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: screenSize.height * 0.70,
            width: screenSize.width * 0.9,
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(32),
              dashPattern: const [24, 20],
              color: AppColors.secondaryElement,
              strokeWidth: 5.6,
              child: const Center(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 56),
                    child: Icon(
                      Icons.add,
                      color: AppColors.secondaryElement,
                      size: 50,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
