import 'package:equatable/equatable.dart';

abstract class UserEvents extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeUserEvent extends UserEvents {}

class UserInputEvent extends UserEvents {
  final String userName;
  final String userEmail;

  UserInputEvent({required this.userName, required this.userEmail});
  @override
  List<Object?> get props => [userName, userEmail];
}


