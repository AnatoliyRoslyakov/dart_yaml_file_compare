import 'package:app_yaml_compare/ui/theme/app_colors.dart';
import 'package:app_yaml_compare/ui/widget/compare_widget.dart';
import 'package:app_yaml_compare/ui/widget/start_widget.dart';
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    state.success
                        ? CompareWidget(screenSize: screenSize, state: state)
                        : StartWidget(state: state),
                    const SizedBox(
                      height: 10,
                    ),
                    KeyListWidget( //<---обернуть в блок и обновить?
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






