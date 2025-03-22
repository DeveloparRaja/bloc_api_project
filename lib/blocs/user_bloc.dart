import 'dart:math';
import 'package:bloc_flutter/events/user_event.dart';
import 'package:bloc_flutter/states/user_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  UserBloc() : super(UserStates(name: "Raja")) {
    on<ChangeUserEvent>((event, emit) {
      List<String> names = ["Raja", "Sakila", "Amit", "Priya", "Rohan", "Sneha"];
      emit(UserStates(name: names[Random().nextInt(names.length)]));
    });
  }
}

class InputUserBloc extends Bloc<UserInputEvent, InputUserStates> {
  InputUserBloc() : super(InputUserStates(userName: "", userEmail: "")) {
    on<UserInputEvent>((event, emit) {
      emit(InputUserStates(userName: event.userName, userEmail: event.userEmail));
    });
  }
}
