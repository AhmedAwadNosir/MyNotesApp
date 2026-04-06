import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    log("On Change : ${change.toString()} ");
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    log("On Closed : ${bloc.runtimeType.toString()}");
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    log("On Closed : ${bloc.runtimeType.toString()}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
