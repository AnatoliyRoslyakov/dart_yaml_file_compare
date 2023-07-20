import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:app_yaml_compare/domaim/state/generate_value/value_bloc.dart';
import 'package:app_yaml_compare/ui/theme/app_button.dart';
import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domaim/state/upload_file/upload_file_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadFileBloc, UploadFileState>(
        builder: (context, state) {
      return Scaffold(
          body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.mainElement)),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                                children: [
                                  ConstrainedBox(
                                      constraints: const BoxConstraints(
                                          maxWidth: 90, minWidth: 90),
                                      child: Text(
                                        state.fileName1,
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
                  file1: state.file1,
                  file2: state.file2,
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}

class KeyListWidget extends StatelessWidget {
  final file1;
  final file2;
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
                        isAlwaysShown: true,
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
                                              state.keyList[index], false));
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

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValueBloc, ValueState>(builder: (context, state) {
      return Row(
        children: [
          Container(
              width: 300,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.mainElement)),
              child: state.switchColor
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        itemCount: state.lines1.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: double.infinity,
                                color: state.colorList1[index],
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${(index + 1).toString()}: ',
                                      style: TextStyle(
                                          color: state.colorList1[index] ==
                                                  AppColors.orange
                                              ? Colors.red
                                              : AppColors.mainElement),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      state.lines1[index],
                                      style: const TextStyle(
                                        color: AppColors.mainText,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SingleChildScrollView(
                          child: Text(
                        state.value1,
                        style: const TextStyle(color: AppColors.mainText),
                      )),
                    )),
          Container(
              width: 300,
              height: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.mainElement)),
              child: state.switchColor
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ListView.builder(
                        itemCount: state.lines2.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Container(
                                width: double.infinity,
                                color: state.colorList2[index],
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      '${(index + 1).toString()}: ',
                                      style: TextStyle(
                                          color: state.colorList2[index] ==
                                                  AppColors.orange
                                              ? AppColors.red
                                              : AppColors.mainElement),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      state.lines2[index],
                                      style: const TextStyle(
                                        color: AppColors.mainText,
                                      ),
                                    ),
                                  ],
                                )),
                          );
                        },
                      ),
                    )
                  : SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.value2,
                          style: const TextStyle(color: AppColors.mainText),
                        ),
                      ),
                    ))
        ],
      );
    });
  }
}
