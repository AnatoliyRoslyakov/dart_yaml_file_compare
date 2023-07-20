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
          IconButton(
              onPressed: () {
                context.read<ValueBloc>().add(const ValueEvent.switchColor());
              },
              icon: state.switchColor
                  ? const Icon(
                      Icons.lens,
                      color: AppColors.mainElement,
                    )
                  : const Icon(Icons.panorama_fish_eye,
                      color: AppColors.mainElement)),
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
