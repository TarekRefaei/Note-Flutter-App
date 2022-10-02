import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/bloc/local_or_online/local_or_online_bloc.dart';
import 'package:notes/bloc/notes/notes_bloc.dart';
import 'package:notes/bloc/search/search_bloc.dart';
import 'package:notes/config/app_router.dart';
import 'package:notes/ui/screens/notes_page.dart';
import 'package:path/path.dart';
import 'bloc/filter/filter_bloc.dart';
import 'config/theme.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NotesBloc>(
          create: (context) => NotesBloc()
            ..add(
              const GetAllNotesEvent(),
            ),
        ),
        BlocProvider<LocalOrOnlineBloc>(
          create: (context) => LocalOrOnlineBloc()
            ..add(
              const StartOptions(),
            ),
        ),
        BlocProvider(
          create: (context) => SearchBloc()
            ..add(
              const SearchGetAllNotesForSearchEvent(),
            ),
        ),
        BlocProvider(
          create: (context) => FilterBloc()
            ..add(
              const FilterGetAllNotesForFilterEvent(),
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: NotesHomeScreen.routeName,
      onGenerateRoute: AppRouter.onGeneratedRoute,
    );
  }
}
