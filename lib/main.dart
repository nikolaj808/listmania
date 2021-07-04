import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/app.dart';
import 'package:listmania/src/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  FlutterError.onError = (details) => log(
        details.exceptionAsString(),
        stackTrace: details.stack,
      );

  runZonedGuarded(
    () => runApp(App()),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
