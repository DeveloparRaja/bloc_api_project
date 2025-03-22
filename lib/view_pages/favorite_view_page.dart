import 'package:bloc_flutter/blocs/api_user_bloc.dart';
import 'package:bloc_flutter/events/api_user_event.dart';
import 'package:bloc_flutter/states/api_user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewPage extends StatefulWidget {
  const FavoriteViewPage({super.key});

  @override
  State<FavoriteViewPage> createState() => _FavoriteViewPageState();
}

class _FavoriteViewPageState extends State<FavoriteViewPage> {
  @override
  void initState() {
    super.initState();
    context.read<ApiUserBloc>().add(FetchFavoritesEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite store page"),
      ),
      body:BlocBuilder<ApiUserBloc,ApiUserState>(builder: (context, state) {
        if(state is UserLoading){
          return Center(child: CircularProgressIndicator(),);
        }
        else if(state is FavoriteLoaded){
          return ListView.builder(
            itemCount: state.favoriteProducts.length,
            itemBuilder: (context, index) {
            var product = state.favoriteProducts[index];
            return Card(
              child: ListTile(
                leading: Image.network(product["image"]),
                title: Text(product['title']??"no title"),
                subtitle: Text("${product["price"]}"??"no price"),
              ),
            );
          },);

        } else if(state is UserError){
          return Center(child: Text(state.message),);
        }
        return Center(child: Text("No Favorites"),);
      },) ,
    );
  }
}
