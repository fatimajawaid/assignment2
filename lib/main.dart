import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/product_bloc.dart';
import 'blocs/product_event.dart'; // Add this import
import 'views/home_screen.dart';
import 'repository/product_repository.dart';
import 'package:flutter/src/material/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(FetchProducts()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Assignment 2',
        theme: ThemeData(fontFamily: 'Roboto', primarySwatch: Colors.deepPurple),
        home: HomeScreen(),
      ),
    );
  }
}
