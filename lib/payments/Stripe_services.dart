// lib/services/stripe-backend-service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;


class CreateAccountResponse {
   String url;
   bool success;

  CreateAccountResponse(String url, bool success) {
    this.url = url;
    this.success = success;
  }
}

class CheckoutSessionResponse {
   Map<String, dynamic> session;

  CheckoutSessionResponse(Map<String, dynamic> session) {
    this.session = session;
  }
}

class StripeBackendService {
  // static String apiBase = '$BACKEND_HOST/api/stripe';
  static String createAccountUrl =
      '${StripeBackendService.apiBase}/account?mobile=true';
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Future<CreateAccountResponse> createSellerAccount() async {
    var url = Uri.parse(StripeBackendService.createAccountUrl);
    var response = await http.get(url, headers: StripeBackendService.headers);
    Map<String, dynamic> body = jsonDecode(response.body);
    return new CreateAccountResponse(body['url'], true);
  }
}
