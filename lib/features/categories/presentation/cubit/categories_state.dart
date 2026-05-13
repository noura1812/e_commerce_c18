part of 'categories_cubit.dart';

class CategoriesState extends Equatable {
  final List<CategoryEntity>? categories;
  final List<CategoryEntity>? subCategories;
  final bool catLoading, subLoading;
  final CategoryEntity? selectedCategory;
  final ErrorModel? categoriesFailure, subCategoriesFailure;
  const CategoriesState({
    this.categories,
    this.subCategories,
    this.catLoading = false,
    this.subLoading = false,
    this.categoriesFailure,
    this.subCategoriesFailure,
    this.selectedCategory,
  });

  CategoriesState copyWith({
    List<CategoryEntity>? categories,
    List<CategoryEntity>? subCategories,
    bool? catLoading,
    bool? subLoading,
    ErrorModel? categoriesFailure,
    ErrorModel? subCategoriesFailure,
    CategoryEntity? selectedCategory,
  }) {
    return CategoriesState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      categories: categories ?? this.categories,
      subCategories: subCategories ?? this.subCategories,
      catLoading: catLoading ?? this.catLoading,
      subLoading: subLoading ?? this.subLoading,
      categoriesFailure: categoriesFailure ?? this.categoriesFailure,
      subCategoriesFailure: subCategoriesFailure ?? this.subCategoriesFailure,
    );
  }

  @override
  List<Object?> get props => [
    categories,
    subCategories,
    catLoading,
    subLoading,
    categoriesFailure,
    subCategoriesFailure,
    selectedCategory,
  ];
}
