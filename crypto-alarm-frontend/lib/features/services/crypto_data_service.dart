import 'dart:convert'; // For JSON decoding
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchCryptoPrices() async {
  final url = Uri.parse('http://localhost:1000/crypto'); // Replace with your server's URL
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return json.decode(response.body); // Parse the JSON response
  } else {
    throw Exception('Failed to load crypto prices');
  }
}
