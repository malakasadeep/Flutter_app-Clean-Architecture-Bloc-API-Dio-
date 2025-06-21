import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    // Simulate a delay for splash screen
    await Future.delayed(const Duration(seconds: 2));

    emit(
      Autenticated(), // or UnAutenticated() based on your logic
    );
  }
}
