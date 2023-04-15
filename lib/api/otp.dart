import 'package:http/http.dart' as http;
import 'dart:convert';

class OtpApi {
  // Replace with your API key and project ID
  static sendOtp(String phoneNumber) async {
    String apiKey = 'AIzaSyB5M8WjpcdNu6mmYZDeWIW5iLxJk3TaHjw';
    String projectId = 'klick-wash-f903c';
    final response = await http.post(
      Uri.parse(
          'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$apiKey'),
      body: jsonEncode({
        'requestType': 'PHONE_SIGN_IN',
        'phoneNumber': phoneNumber,
        'idToken': projectId,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print(responseBody['sessionInfo']);
      return responseBody[
          'sessionInfo']; // This will be used to verify the OTP later
    } else {
      throw Exception('Failed to send OTP');
    }
  }
}
