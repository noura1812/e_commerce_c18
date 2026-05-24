import 'package:bloc/bloc.dart';
import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/products/domain/entities/product_entity.dart';
import 'package:e_commerce_c18/features/products/domain/entities/products_filter_entity.dart';
import 'package:e_commerce_c18/features/products/domain/usecases/get_products_by_sub_cat.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._getProductsBySubCatUsecase) : super(ProductsInitial());
  ProductsFilterEntity filter = ProductsFilterEntity();

  final GetProductsWithFiltersUsecase _getProductsBySubCatUsecase;
  getProductsWithSearch({String? id, String? sort, String? text}) async {
    emit(GetProductsLoadingState());
    filter = filter.copyWith(categoryId: id, sort: sort, text: text);
    CustomResponse<List<ProductEntity>> response = await _getProductsBySubCatUsecase(filter);

    switch (response) {
      case Success<List<ProductEntity>>():
        emit(GetProductsSuccessState(products: response.data));
      case Failure<List<ProductEntity>>():
        emit(GetProductsFailureState(errorModel: response.error));
    }
  }
}
