import 'package:flutter/material.dart';
import 'package:hostels/presentation/hotels_screen/hotels_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart';
import 'presentation/hotels_screen/bloc/hotels_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey[200],
          fontFamily: 'SF-Pro-Display'
          ),
        home:BlocProvider(
              create: (context) => getIt<HotelsBloc>()..add(const HotelsEvent.getHotels()),
              child: const HotelsScreen(),
            )
            );
  }
}
