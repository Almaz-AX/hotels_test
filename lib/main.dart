import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            fontFamily: 'SF-Pro-Display',
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(color: Colors.white),
                  backgroundColor: Colors.blue[700],
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
            inputDecorationTheme: InputDecorationTheme(
                focusColor: Colors.transparent,
                activeIndicatorBorder: BorderSide.none,
                filled: true,
                fillColor: Colors.grey[200],
                isDense: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                labelStyle: const TextStyle(color: Colors.black26))),
        home: BlocProvider(
          create: (context) =>
              getIt<HotelsBloc>()..add(const HotelsEvent.getHotels()),
          child: const HotelsScreen(),
        ));
  }
}
