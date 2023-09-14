import 'package:app_yaml_compare/domaim/state/generate_format_text/format_text_bloc.dart';
import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:app_yaml_compare/domaim/state/upload_file/upload_file_bloc.dart';
import 'package:app_yaml_compare/ui/theme/app_button.dart';
import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompareWidget extends StatelessWidget {
  const CompareWidget({
    super.key,
    required this.screenSize, required this.state,
  });
  final UploadFileState state;
  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(right: 20, left: 5),
            child: InkWell(
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
                        width: state.format ? 4 : 1),
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
      );
  }
}