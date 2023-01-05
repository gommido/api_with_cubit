import 'package:api_with_cubit/data/models/products_model.dart';
import 'package:api_with_cubit/data/repositories/products_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitial());
  final ProductsRepo _productsRepo;
  late  List<Products> _products=[];

    List<Products> get products => _products;


  static ProductsCubit get(context) => BlocProvider.of<ProductsCubit>(context);

  List<Products>? getProducts(){
    emit(ProductsLoadingState());
    _productsRepo.getProducts().then((products){
      _products = products;
      emit(ProductsSuccessState());
    }).catchError((error){
      emit(ProductsErrorState(error));
    }
    );
    return _products;
  }
}
