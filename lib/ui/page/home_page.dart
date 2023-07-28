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
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  overlayColor:
                                      const Color.fromARGB(255, 246, 126, 118),
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
                                    ConstrainedBox(
                                        constraints: const BoxConstraints(
                                            maxWidth: 90, minWidth: 90),
                                        child: Text(
                                          state.fileName2,
                                          style: const TextStyle(
                                              color: AppColors.mainElement),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                    const SizedBox(
                                      width: 10,
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
                        ])),
                KeyListWidget(
                  file1: state.file1!,
                  file2: state.file2!,
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}
