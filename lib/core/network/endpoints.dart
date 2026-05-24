class Endpoints {
  static const String baseUrl = 'https://ecommerce.routemisr.com/api/v1';

  //Auth
  static const String login = '/auth/signin';
  static const String signup = '/auth/signup';
  static const String categories = '/categories';
  static const String products = '/products';
  static const String wishlist = '/wishlist';
  static const String cart = '/cart';
  static String subCategoriesOfCategory(String id) => '/categories/$id/subcategories';

  //
}
