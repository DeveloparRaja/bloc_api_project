import 'package:equatable/equatable.dart';

abstract class ApiUserState extends Equatable{
  List<Object> get props => [];
}

class UserInitial extends ApiUserState{}
class UserLoading extends ApiUserState{}
class UserLoaded extends ApiUserState{
  final List<dynamic> aipUsers;
  UserLoaded(this.aipUsers);
  @override
  List<Object> get props =>[aipUsers];
}
class UserError extends ApiUserState{
  final String message;
  UserError(this.message);
  @override
  List<Object> get props => [message];
}

class FavoriteState extends ApiUserState{}

class FavoriteLoaded extends ApiUserState{
  final List<Map<String,dynamic>> favoriteProducts;
  FavoriteLoaded(this.favoriteProducts);
}