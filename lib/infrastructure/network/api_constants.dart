
class ApiConstants {


  var baseUrl = 'http://appentus.in/rmhex-crm/api/v1/'; // client server

  var signIn = 'signin';
  var resetPassword = 'resetpassword';

  // profile
  var getCountries = 'get-countries';
  var updateUserProfile = 'update-user-profile';
  var updateUserPassword = 'update-user-password';

  /// users
  var getRoles = 'get-roles';
  var addSubAdmin = 'add-subadmin';
  var updateSubAdmin = 'update-sub-admin';
  var getUsers = 'getUsers';
  var updateSubAdminStatus = 'update-subadmin-status';

  /// product category
  var getProductCategory = 'get-product-category';
  var createProductCategory = 'create-product-category';
  var updateProductCategory = 'update-product-category';
  var updateProductCategoryStatus = 'toggle-product-category-status';
  var getProductCategoryWP = 'get-product-category-quick';

  ///product
  var getProducts = 'get-product';
  var updateProductStatus = 'toggle-product-status';
  var createProduct = 'create-product';
  var updateProduct = 'update-product';

  /// currency
  var createCurrency = 'create-currency';
  var getCurrency = 'get-currency';
  var updateCurrencyStatus = 'toggle-currency-status';
  var updateCurrency = 'update-currency';
  var getCurrencyWP = 'get-currency-quick';

}