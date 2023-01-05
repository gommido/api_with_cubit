import 'package:api_with_cubit/ui/cubit/products_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/products_model.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsErrorState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error!!!'))
          );
        }
      },
      builder: (context, state) {
        var cubit = ProductsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
                'Products Page'
            ),

          ),
          body: ConditionalBuilder(
            condition: state is ProductsSuccessState,
            builder: (context) => ListView.separated(
              separatorBuilder: (context, index) => Container(
                height: MediaQuery.of(context).size.height / 25,
              ),
              itemCount: cubit.products.length,
                itemBuilder: (context, index){
                  return ListTile(
                    title: Text('${cubit.products[index].title}'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.products[index].category} '),
                        Text(

                            '${cubit.products[index].brand}'),

                      ],
                    ),

                    leading:  CircleAvatar(
                      child: Text(

                          '${cubit.products[index].id}'
                      ),
                    ),
                    trailing: Text('\$${cubit.products[index].price}'),
                  );
                }
            ),
            fallback: (BuildContext context) {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}
