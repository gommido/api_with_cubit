import 'package:api_with_cubit/data/repositories/products_repo.dart';
import 'package:api_with_cubit/data/web_service/products_web_service.dart';
import 'package:api_with_cubit/ui/cubit/products_cubit.dart';
import 'package:api_with_cubit/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final productsRepo = ProductsRepo(
        ProductsWebService());

    return BlocProvider(
      create: (context) => ProductsCubit(productsRepo)..getProducts(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(

            primarySwatch: Colors.blue,
          ),
          home:  MyHomePage()
      ),
    );
  }
}