import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:proxy_interception_requests/app_data/app_data.dart';
import 'package:proxy_interception_requests/features/model/domain/enums/request_package_type.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/list_all_products/list_all_products_entity.dart';
import 'package:proxy_interception_requests/features/model/domain/models/products/product/product_entity.dart';
import 'package:proxy_interception_requests/features/model/product_repository_dio.dart';
import 'package:proxy_interception_requests/features/model/singletons/request_packages_type_singleton.dart';

class RequestViewModel with ChangeNotifier {
  final RequestPackageType requestPackageType;
  RequestViewModel({required this.requestPackageType}) {
    RequestPackagesTypeSingleton().setup(requestPackageType);
  }

  bool isLoading = false;

  List<ProductEntity> products = [];

  Future<void> getAllProducts() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    try {
      ListAllProductEntity mediaList =
          await ProductRepository().getAllProducts();
      products = mediaList.products;
    } catch (e) {
      AppData.toast.showError(e.toString());
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  TextEditingController titleProductController = TextEditingController();

  void onAddProductTap(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add product'),
        content: TextField(
          controller: titleProductController,
          decoration: const InputDecoration(
            labelText: 'title',
          ),
        ),
        actions: <Widget>[
          FilledButton(
            child: const Text('Add'),
            onPressed: () {
              addProducts(titleProductController.text);
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Future<void> addProducts(String title) async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
    try {
      await ProductRepository().addProduct(title);
      AppData.toast.showTaost("Product added");
    } catch (e) {
      AppData.toast.showError(e.toString());
      log(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void cleanData() {
    RequestPackagesTypeSingleton().clean();
  }
}
