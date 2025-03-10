import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prime_timer/core/service_locator.dart';
import 'package:prime_timer/features/prime/presentation/controller/prime_timer_controller.dart';
import 'package:prime_timer/features/prime/presentation/widgets/clock.dart';
import 'package:prime_timer/features/prime/presentation/screens/prime_notfication_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
      ),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription primeNumberSub;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final nav = Navigator.of(context);
    var messenger = ScaffoldMessenger.of(context);
    primeNumberSub =  PrimeTimerController(
      getPrimeNumberWithElapsedTimeUsecase: getIt(),
    ).getPrimeNumberStream().listen(
      (event) {
        nav.popUntil((route) => route.isFirst);
        nav.push(
          MaterialPageRoute(
            builder:
                (context) => PrimeNotficationScreen(
                  primeNumber: event.primeNumber,
                  elapsedTime: event.elapsedSeconds,
                ),
          ),
        );
        if (event.error != null) {
          messenger.showSnackBar(SnackBar(content: Text(event.error!,style: TextStyle(color: Colors.white),),backgroundColor: Colors.orange,));
        }
      },
      onError: (error) {
        messenger.showSnackBar(SnackBar(content: Text(error.toString(),style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
      },
    );
  }

  @override
  void dispose() {
    primeNumberSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Clock(),
      ),
    );
  }
}
