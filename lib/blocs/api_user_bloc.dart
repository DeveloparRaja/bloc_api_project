import 'package:bloc_flutter/events/api_user_event.dart';
import 'package:bloc_flutter/service/api_user_service.dart';
import 'package:bloc_flutter/states/api_user_states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiUserBloc extends Bloc<ApiUserEvent, ApiUserState> {
  final ApiService apiService;

  ApiUserBloc(this.apiService) : super(UserInitial()) {
    on<ApiFetchUser>(_fetchUsers);
    on<FavoritesEvent>(_addToFavorites);
    on<FetchFavoritesEvent>(_fetchFavorites);
  }

  void _fetchUsers(ApiFetchUser event, Emitter<ApiUserState> emit) async {
    emit(UserLoading());
    try {
      final apiUser = await apiService.apiFetchUsers();
      emit(UserLoaded(apiUser));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }

  void _addToFavorites(FavoritesEvent event, Emitter<ApiUserState> emit) async {
    try {
      await FirebaseFirestore.instance.collection("favorites_Product").add(event.product);
      emit(FavoriteState());
    } catch (e) {
      emit(UserError("Failed to add to favorites"));
    }
  }

  void _fetchFavorites(FetchFavoritesEvent event, Emitter<ApiUserState> emit) async {
    emit(UserLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("favorites_Product").get();

      List<Map<String, dynamic>> favorites = querySnapshot.docs.map((doc) {
        return {
          "id": doc.id,
          "title": doc["title"] ?? "No Title",
          "image": doc["image"] ?? "",
          "price": doc["price"] ?? "N/A"
        };
      }).toList();

      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(UserError("Failed to fetch favorites: $e"));
    }
  }

}
void raja(){
  print(" hello guys");
}