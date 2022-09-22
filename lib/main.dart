import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tasks_bloc/screen/tasks_screen.dart';
import 'package:tasks_bloc/blocs/block_exports.dart';
import 'package:tasks_bloc/services/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(() => runApp(MyApp(appRouter: AppRouter(),)), storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Tasks App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TasksScreen(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
