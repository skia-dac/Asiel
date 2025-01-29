import 'package:get/get.dart';
import 'package:ShapeCom/domain/product/my_product.dart';

class ProductListController extends GetxController {
  final List<ProductModel> _products = [
    // Sample products
    ProductModel(name: 'Product 1', description: 'Description 1'),
    ProductModel(name: 'Product 2', description: 'Description 2'),
    ProductModel(name: 'Product 3', description: 'Description 3'),
  ];

  var filteredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredProducts.assignAll(_products);
  }

  void filterProducts(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(_products);
    } else {
      filteredProducts.assignAll(
        _products.where((product) => product.name.toLowerCase().contains(query.toLowerCase()))
      );
    }
  }
}
