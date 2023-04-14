import 'package:fit_track/presentation/auth/view_model/login_cubit.dart';
import 'package:fit_track/config/routes_manager.dart';
import 'package:fit_track/config/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeDatas().getApplicationTheme(),
            onGenerateRoute: RouteGenerator().getRoute,
            initialRoute: Routes.loginRoute,
          );
        },
      ),
    );
  }
}
