import 'package:app_yaml_compare/domaim/state/generate_key_list/key_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'domaim/state/generate_value/value_bloc.dart';
import 'domaim/state/upload_file/upload_file_bloc.dart';
import 'ui/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider<UploadFileBloc>(
              create: (context) =>
                  UploadFileBloc()..add(const UploadFileEvent.init()),
            ),
            BlocProvider<KeyListBloc>(
              create: (context) =>
                  KeyListBloc()..add(const KeyListEvent.create('', '',)),
            ),

            BlocProvider<ValueBloc>(
              create: (context) =>
                  ValueBloc()..add(const ValueEvent.create('', '', '', false)),
            ),
          ],
          child: const HomePage(),
        ));
  }
}
