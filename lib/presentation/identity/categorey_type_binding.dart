import 'package:appentus_dummy/presentation/identity/categorey_type_controller.dart';
import 'package:get/get.dart';

class CategoryTypeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CategoryTypeController());
  }

}