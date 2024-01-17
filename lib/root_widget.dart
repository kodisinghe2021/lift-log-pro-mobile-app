import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liftlogpro_app/logic/bloc/initializing_bloc/initializing_bloc.dart';
import 'package:liftlogpro_app/presentation/screens/home_hook.dart';
import 'package:liftlogpro_app/presentation/screens/splash_screen.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InitializingBloc>(
          create: (context) =>
              InitializingBloc()..add(StartInitializingEvent()),
        )
      ],
      child: MaterialApp(
        home: BlocConsumer<InitializingBloc, InitializingState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is InitializeInsertingSuccessState) {
            return  const HomeHook();
            }
            return const SplashScreen();
          },
        ),
      ),
    );
  }
}
