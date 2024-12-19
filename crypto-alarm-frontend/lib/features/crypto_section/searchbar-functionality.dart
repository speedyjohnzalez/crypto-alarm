import 'dart:io';
import 'dart:convert';

void main() async {
  /// Connect to a WebSocket server
  final uri = Uri.parse('ws://localhost:8080');
  final socket = await WebSocket.connect(uri.toString());
  

  print('Connected to: $uri');

  // Listen to incoming messages
  socket.listen(
    (message) {
      // Function that converts incoming UTF8 encoded data into a dart map
      Map<String, dynamic> messageConverter() {
        dynamic utf8Data = message;
        String dataToJsonString = utf8.decode(utf8Data);
        Map<String, dynamic> jsonStringToMap = jsonDecode(dataToJsonString);
        return jsonStringToMap;
      }
      
      print(messageConverter()['price']);
      
    },
    onDone: () {
      print('Connection closed.');
    },
    onError: (error) {
      print('Error: $error');
    },
  );

  // Send a message to the WebSocket server / socket.add('Hello, WebSocket server!');

  // Close the WebSocket after 5 seconds
  await Future.delayed(Duration(seconds: 5));
  socket.close();
  print('Connection closed by client.');
}