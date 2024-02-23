import 'package:appentus_dummy/presentation/filter/filter_controller.dart';
import 'package:get/get.dart';

class FilterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController());
  }
}