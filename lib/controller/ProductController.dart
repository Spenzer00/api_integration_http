import 'package:api_integration_http/service/http_service.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  //.obs is for monitoring the changes in list and loading state
  var isLoading = true.obs;
  var productlist = [].obs;


  @override
  void onInit() {
    fetchProduct();
    super.onInit();
  }

  void fetchProduct() async {
    try{
      isLoading(true);
      var products = await HttpService.fetchProduct();
      if(products !=null){
        productlist.value = products;
      }
    }
    catch (e) {
      print(e);
    }finally{
        isLoading(false);
    }
    }
  }