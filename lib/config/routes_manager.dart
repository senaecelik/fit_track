import 'package:fit_track/domain/model/workout.dart';
import 'package:fit_track/presentation/auth/login_screen.dart';
import 'package:fit_track/presentation/auth/register_screen.dart';
import 'package:fit_track/presentation/home/add_training/add_training_screen.dart';
import 'package:fit_track/presentation/home/add_training/view_model/add_training_cubit.dart';
import 'package:fit_track/presentation/home/editing_training/view_model/editing_training_cubit.dart';
import 'package:fit_track/presentation/home/home_screen.dart';
import 'package:fit_track/presentation/home/editing_training/editing_training_screen.dart';
import 'package:fit_track/presentation/home/list_training/view_model/list_training_cubit.dart';
import 'package:fit_track/presentation/home/list_training/list_training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//Aynı route’u uygulamanın birçok yerinde kullanmamız gerekebilir.
//Bunun için önce route’ları tanımlıyoruz.
//main.dart dosyamızdaki MaterialApp’in içinde bir nevi route tablosu yapıyoruz,

class Routes {
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";

  static const String homeRoute = "/home";
  static const String listTrainingRoute = "/listTraining";
  static const String editingTrainingRoute = "/editingTrainingRoute";
  static const String addTraningRoute = "/addTrainingRoute";
}

class RouteGenerator {
  Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

      case Routes.registerRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );

      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (context) {
            return const HomeScreen();
          },
        );

      case Routes.listTrainingRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: Cubits.instance.listTrainingCubit,
            child: ListTrainingScreen(
              dayName: routeSettings.arguments.toString(),
            ),
          ),
        );

      case Routes.editingTrainingRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                      value: Cubits.instance.editingTrainingCubit,
                    ),
                    BlocProvider.value(
                      value: Cubits.instance.listTrainingCubit,
                    ),
                  ],
                  child: EditingTrainingScreen(
                    workout: routeSettings.arguments as Workout,
                  ),
                ));

      case Routes.addTraningRoute:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider.value(
                        value: Cubits.instance.addTrainingCubit,
                      ),
                      BlocProvider.value(
                        value: Cubits.instance.listTrainingCubit,
                      ),
                    ],
                    child: AddTrainingScreen(
                        dayName: routeSettings.arguments.toString())));
      default:
        return _unDefinedRoute();
    }
  }

//Eğer tanımladığımız route’lar dışında bir route
//giderse burda yarattığımız route’a gitsin diye “No route found” yazan bir sayfa.
  static Route<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text("No Route Found"),
        ),
        body: const Center(child: Text("No Route Found")),
      ),
    );
  }
}

//Birçok yer de provider edilmesi gerekebilir.
class Cubits {
  static final Cubits _instance = Cubits._init();
  static Cubits get instance => _instance;
  Cubits._init();

  final ListTrainingCubit listTrainingCubit = ListTrainingCubit();
  final AddTrainingCubit addTrainingCubit = AddTrainingCubit();
  final EditingTrainingCubit editingTrainingCubit = EditingTrainingCubit();
}
