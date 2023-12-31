import 'package:app_yaml_compare/domaim/state/generate_format_text/format_text_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domaim/state/generate_value/value_bloc.dart';
import '../theme/app_colors.dart';

class ValueWidget extends StatelessWidget {
  const ValueWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValueBloc, ValueState>(builder: (context, state) {
      return BlocBuilder<FormatTextBloc, FormatTextState>(
          builder: (context, stateFormat) {
        return stateFormat.switchFormat
            ? Row(
                children: [
                  ContentContainerFormat(
                      value: stateFormat.value1, keyIndex: stateFormat.key),
                  ContentContainerFormat(
                      value: stateFormat.value2, keyIndex: stateFormat.key)
                ],
              )
            : Row(children: [
                ContentContainer(
                    listLength: state.lines1.length,
                    color: state.colorList1,
                    lines: state.lines1,
                    value: state.value1),
                ContentContainer(
                    listLength: state.lines2.length,
                    color: state.colorList2,
                    lines: state.lines2,
                    value: state.value1),
              ]);
      });
    });
  }
}

class ContentContainerFormat extends StatelessWidget {
  final (String, List<int>) value;
  final String keyIndex;
  const ContentContainerFormat({
    super.key,
    required this.value,
    required this.keyIndex,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        width: screenSize.width * 0.35,
        height: screenSize.height,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.mainElement)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  keyIndex,
                  style: const TextStyle(
                      color: AppColors.mainElement,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Expanded(
                child: SingleChildScrollView(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const SizedBox(
                                    width: 5,
                                  ),
                      ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: SizedBox(
                          width: 35,
                          child: ListView.builder(shrinkWrap: true,
                           physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.$2.length,
                            itemBuilder: (context, index){
                              return Text('${value.$2[index].toString()}:', style: const TextStyle(
                                        color: AppColors.mainElement,  fontFamily: 'Consolas'), textAlign: TextAlign.right);
                            }),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: SelectableText(value.$1, style: const TextStyle(color: AppColors.mainText, fontFamily: 'Consolas'),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ContentContainer extends StatelessWidget {
  final int listLength;
  final List<Color> color;
  final List<String> lines;
  final String value;
  const ContentContainer({
    super.key,
    required this.listLength,
    required this.color,
    required this.lines,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        width: screenSize.width * 0.35,
        height: screenSize.height,
        // width: 350,
        // height: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.mainElement)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  value,
                  style: const TextStyle(
                      color: AppColors.mainElement,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView.builder(
                  itemCount: lines.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                          color: color[index],
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                            
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${(index + 1).toString()}: ',
                                  style: TextStyle(
                                      color: color[index] == AppColors.orange
                                          ? Colors.red
                                          : AppColors.mainElement),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  overflow: TextOverflow.ellipsis,
                                  lines[index],
                                  style: const TextStyle(
                                    color: AppColors.mainText,
                                  ),
                                ),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
