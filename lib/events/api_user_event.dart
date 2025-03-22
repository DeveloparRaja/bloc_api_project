import 'package:equatable/equatable.dart';

abstract class ApiUserEvent extends Equatable{
  List<Object> get props => [];
}

class ApiFetchUser extends ApiUserEvent{}

class FavoritesEvent extends ApiUserEvent{

  final Map<String,dynamic> product;
  FavoritesEvent(this.product);

}

class FetchFavoritesEvent extends ApiUserEvent{

}