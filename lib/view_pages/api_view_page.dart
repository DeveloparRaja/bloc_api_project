import 'package:bloc_flutter/blocs/api_user_bloc.dart';
import 'package:bloc_flutter/events/api_user_event.dart';
import 'package:bloc_flutter/states/api_user_states.dart';
import 'package:bloc_flutter/view_pages/favorite_view_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiViewPage extends StatefulWidget {
  const ApiViewPage({super.key});

  @override
  State<ApiViewPage> createState() => _ApiViewPageState();
}

class _ApiViewPageState extends State<ApiViewPage> {
  @override
  void initState() {
    super.initState();
    context.read<ApiUserBloc>().add(ApiFetchUser());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Product View"),
        actions: [
          IconButton(onPressed: () {

            // Navigator.of(MaterialApp as BuildContext).push(MaterialPageRoute(builder: (MaterialAppContext) => FavoriteViewPage()));

            // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteViewPage(),));

            Navigator.push(context, MaterialPageRoute(builder: (context) => BlocProvider.value(
              value: context.read<ApiUserBloc>(),
              child: FavoriteViewPage(),
            ),));
          }, icon: Icon(Icons.favorite)),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: BlocBuilder<ApiUserBloc, ApiUserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if (state is UserLoaded) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              padding: EdgeInsets.all(10),
              itemCount: state.aipUsers.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.network(
                          state.aipUsers[index]["image"],
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.aipUsers[index]["title"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text("\$${state.aipUsers[index]["price"]}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    var product = {
                                      "title": state.aipUsers[index]["title"],
                                      "image": state.aipUsers[index]["image"],
                                      "price": state.aipUsers[index]["price"]
                                    };

                                    context.read<ApiUserBloc>().add(FavoritesEvent(product));
                                  },
                                  icon: Icon(Icons.favorite_border),
                                )

                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          else if (state is UserError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text("Press the button to load products"),
          );
        },
      ),
    );
  }
}
