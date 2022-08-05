import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_api/pages/home_page.dart';
import 'package:wheather_api/states/weather_cubit.dart';

void main() {
  runApp(
    BlocProvider(create: (context) => WeatherCubit(),
        child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const Homepage(),
    );
  }
}

