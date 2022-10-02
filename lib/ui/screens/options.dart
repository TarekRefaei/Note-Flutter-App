import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/ui/widgets/app_bar.dart';

import '../../bloc/local_or_online/local_or_online_bloc.dart';

class OptionsScreen extends StatelessWidget {
  const OptionsScreen({Key? key}) : super(key: key);

  static const String routeName = '/options';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const OptionsScreen(),
      settings: const RouteSettings(
        name: routeName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NotesAppBar(
        title: 'Options',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Use Local Database",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    "Instead of Using HTTP call to work with app data ,"
                    " Please use SQLite for this ",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            BlocBuilder<LocalOrOnlineBloc, LocalOrOnlineState>(
              builder: (context, state) {
                if (state is LocalOrOnlineLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is LocalOrOnlineLoaded) {
                  return SizedBox(
                    width: 100,
                    child: SwitchListTile(
                      dense: false,
                      onChanged: (bool value) {
                        context
                            .read<LocalOrOnlineBloc>()
                            .add(const ToggleSwitch());
                      },
                      value: state.localOrOnline.localOrOnline,
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Something Went Wrong"),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
