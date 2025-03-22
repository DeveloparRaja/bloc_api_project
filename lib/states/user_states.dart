import 'package:equatable/equatable.dart';

class UserStates extends Equatable {
  final String name;

  UserStates({required this.name});

  @override
  List<Object?> get props => [name];
}

class InputUserStates extends Equatable {
  final String userName;
  final String userEmail;

  InputUserStates({required this.userName, required this.userEmail});

  @override
  List<Object?> get props => [userName, userEmail];
}


