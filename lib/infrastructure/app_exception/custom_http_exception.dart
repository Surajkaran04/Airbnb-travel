class CustomHttpException implements Exception {
  String? message;
  String? type;
  CustomHttpException({required this.message,required this.type});
}