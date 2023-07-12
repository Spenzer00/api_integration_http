import 'package:api_integration_http/screens/Home/widget/ProductTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/ProductController.dart';

void main() {
  runApp(GetMaterialApp(
    home: HomeApi(),
  ));
}

class HomeApi extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Product Page"),
        ),
        body: SizedBox(child: Obx(() {
          if (productController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: productController.productlist.length,
                itemBuilder: (context, index) {
                  // observable list from controller class
                  return ProductTile(productController.productlist[index]);
                });
          }
        })));
  }
}