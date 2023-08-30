import 'package:app_yaml_compare/domaim/state/generate_format_text/format_text_bloc.dart';
import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:app_yaml_compare/ui/theme/app_button.dart';
import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domaim/state/upload_file/upload_file_bloc.dart';
import '../widget/key_list_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<UploadFileBloc, UploadFileState>(
        builder: (context, state) {
      return Scaffold(
          body: Center(
        child: Container(
          width: screenSize.width * 0.95,
          height: screenSize.height * 0.95,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.mainElement)),
          // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    state.success
                        ? Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 5),
                                child: InkWell(
                                  onTap: () {
                                    context
                                        .read<FormatTextBloc>()
                                        .add(const SwitchFormatTextEvent());

                                        context.read<UploadFileBloc>().add(const FormatUploadFileEvent());
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: AppColors.mainElement,
                                            width: state.format? 4: 1),
                                        color: AppColors.secondaryElement),
                                    width: screenSize.width * 0.2 - 5,
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
                                          Text(
                                            'Format',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.mainText),
                                            overflow: TextOverflow.ellipsis,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              AppButton(
                                  onPressed: () {
                                    context
                                        .read<UploadFileBloc>()
                                        .add(const UploadFileEvent.init1());
                                    context
                                        .read<KeyListBloc>()
                                        .add(const CreateKeyListEvent('', ''));
                                  },
                                  overlayColor:
                                      const Color.fromARGB(255, 246, 126, 118),
                                  backgroundColor: AppColors.secondaryElement,
                                  borderColor: AppColors.mainElement,
                                  child: Row(
                                    children: [
                                      Text(
                                        state.fileName1,
                                        style: const TextStyle(
                                            color: AppColors.mainElement),
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
                                    context
                                        .read<UploadFileBloc>()
                                        .add(const UploadFileEvent.init2());
                                    context
                                        .read<KeyListBloc>()
                                        .add(const CreateKeyListEvent('', ''));
                                  },
                                  overlayColor:
                                      const Color.fromARGB(255, 246, 126, 118),
                                  backgroundColor: AppColors.secondaryElement,
                                  borderColor: AppColors.mainElement,
                                  child: Row(
                                    children: [
                                      Text(
                                        state.fileName2,
                                        style: const TextStyle(
                                            color: AppColors.mainElement),
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
                          )
                        : Row(children: [
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
                                    child: CircularProgressIndicator(),
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
                                overlayColor:
                                    const Color.fromARGB(255, 246, 126, 118),
                                backgroundColor: AppColors.secondaryElement,
                                borderColor: AppColors.mainElement,
                                child: Row(
                                  children: [
                                    Text(
                                      state.fileName1,
                                      style: const TextStyle(
                                          color: AppColors.mainElement),
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
                                      context.read<KeyListBloc>().add(
                                          CreateKeyListEvent(
                                              state.file1!, state.file2!));
                                    },
                                    child: const Icon(Icons.play_arrow)),
                              )
                            else
                              SizedBox(
                                width: 55,
                                child: AppButton(
                                    onPressed: () {},
                                    borderColor: AppColors.mainElement,
                                    backgroundColor: AppColors.secondaryElement,
                                    overlayColor: const Color.fromARGB(
                                        255, 246, 126, 118),
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
                                    child: CircularProgressIndicator(),
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
                                  overlayColor:
                                      const Color.fromARGB(255, 246, 126, 118),
                                  backgroundColor: AppColors.secondaryElement,
                                  borderColor: AppColors.mainElement,
                                  child: Row(
                                    children: [
                                      Text(
                                        state.fileName2,
                                        style: const TextStyle(
                                            color: AppColors.mainElement),
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
                    KeyListWidget(
                      file1: state.file1!,
                      file2: state.file2!,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ));
    });
  }
}
