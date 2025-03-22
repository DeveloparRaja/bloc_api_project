import 'package:bloc_flutter/blocs/user_bloc.dart';
import 'package:bloc_flutter/events/user_event.dart';
import 'package:bloc_flutter/states/user_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Flutter Bloc"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          BlocBuilder<UserBloc, UserStates>(
            builder: (context, state) => Center(
              child: Text(state.name, style: TextStyle(fontSize: 20)),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              context.read<UserBloc>().add(ChangeUserEvent());
            },
            child: Text("Change User name"),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text("Please fill the fields", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String userName = nameController.text.trim();
              String userEmail = emailController.text.trim();
              context.read<InputUserBloc>().add(UserInputEvent(userName: userName, userEmail: userEmail));
            },
            child: const Text("Submit"),
          ),
          SizedBox(height: 20),
          BlocBuilder<InputUserBloc, InputUserStates>(
            builder: (context, state) {
              return Column(
                children: [
                  Text("Name: ${state.userName}",style: const TextStyle(fontSize: 18)),
                  Text("Email: ${state.userEmail}",style: const TextStyle(fontSize: 18)),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
