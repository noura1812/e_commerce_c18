// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:e_commerce_c18/core/error/error_model.dart';
import 'package:e_commerce_c18/core/response_model/response_model.dart';
import 'package:e_commerce_c18/features/categories/domain/entities/category_entity.dart';
import 'package:e_commerce_c18/features/categories/domain/usecases/get_categories_usecase.dart';
import 'package:e_commerce_c18/features/categories/domain/usecases/get_sub_categories_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'categories_state.dart';

@singleton
class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._categoriesUsecase, this._subcategoriesUsecase) : super(CategoriesState());
  final GetCategoriesUsecase _categoriesUsecase;
  final GetSubCategoriesUsecase _subcategoriesUsecase;
  getCategories() async {
    emit(state.copyWith(catLoading: true));
    CustomResponse<List<CategoryEntity>> response = await _categoriesUsecase();
    switch (response) {
      case Success():
        emit(
          state.copyWith(
            catLoading: false,
            categories: response.data,
            selectedCategory: response.data.isEmpty ? null : response.data.first,
          ),
        );
        if (state.selectedCategory?.id != null) {
          getSubCategories();
        }
      case Failure():
        emit(state.copyWith(catLoading: false, categoriesFailure: response.error));
    }
  }

  getSubCategories() async {
    emit(state.copyWith(subLoading: true));
    CustomResponse response = await _subcategoriesUsecase(state.selectedCategory!.id!);

    switch (response) {
      case Success():
        emit(state.copyWith(subLoading: false, subCategories: response.data));
      case Failure():
        emit(state.copyWith(subLoading: false, subCategoriesFailure: response.error));
    }
  }

  selectCat(CategoryEntity category) {
    emit(state.copyWith(selectedCategory: category));
    getSubCategories();
  }
}
