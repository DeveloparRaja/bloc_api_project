import 'package:bloc_flutter/blocs/api_user_bloc.dart';
import 'package:bloc_flutter/blocs/user_bloc.dart';
import 'package:bloc_flutter/events/api_user_event.dart';
import 'package:bloc_flutter/service/api_user_service.dart';
import 'package:bloc_flutter/view_pages/bottom_navbar_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UserBloc()),
      BlocProvider(create: (context) => InputUserBloc()),
      BlocProvider(create: (context) => ApiUserBloc(ApiService())),
    ], child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavbarPage(),
    ));

  }
}

