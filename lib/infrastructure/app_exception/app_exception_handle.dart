import 'package:get/get.dart';

handleFirebaseException(errorCode) {
  switch (errorCode) {
    case "user-disabled":
      return "User disabled";
    case "too-many-requests":
      return "firebase_too_many_request".tr;
    case "invalid-phone-number":
      return "firebase_invalid_phone_number".tr;
    case "invalid-verification-code":
      return "firebase_invalid_code".tr;
    case "session-expired":
      return "firebase_session_expired".tr;
    case "quota-exceeded":
      return 'Quota exceed';
    case "operation-not-allowed":
      return "Operation not allowed";
    case "network-request-failed":
      return "no_internet".tr;
    case "network_error":
      return "no_internet".tr;
    default:
      return "something_went_wrong".tr;
  }
}



