import 'dart:io';
import 'dart:convert';

/// Function that converts incoming UTF8 encoded data into a map
Map<String, dynamic> utf8ToMap(utf8Message) {
  String utf8ToJsonString = utf8.decode(utf8Message);
  dynamic jsonStringToMap = jsonDecode(utf8ToJsonString);
  return jsonStringToMap;
}

void main() async {
  /// Connect to a WebSocket server
  final uri = Uri.parse('ws://localhost:8080');
  final socket = await WebSocket.connect(uri.toString());

  print('Connected to: $uri');

  // Search functionality to filter out data from the ws
  var search = 'XLM-USD';

  // Listen to incoming messages
  socket.listen((message) {
    dynamic coinData = utf8ToMap(message);
    if (coinData['product_id'] == search) {
      print(
          'Product ID: ${coinData['product_id']}, Price: \$${coinData['price']}');
    } // else {print('nay');}
  }, onDone: () {
    print('Connection closed.');
  }, onError: (error) {
    print('Error: $error');
  });

  // Send a message to the WebSocket server
  // socket.add('Hello, WebSocket server!');

  // Close the WebSocket after 5 seconds
  await Future.delayed(Duration(seconds: 10));
  socket.close();
  print('Connection closed by client.');
}
