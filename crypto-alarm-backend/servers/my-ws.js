function myWebSocket() {
    // Encoder to translate strings into UTF8 format
    const encoder = new TextEncoder;
    const decoder = new TextDecoder;

    // Code to establish my own Websocket
    const WebSocket = require("ws")
    const wss = new WebSocket.Server({ port: 8080 }, () => console.log('WS server created'));

    // User counter to display message in console
    let userCount = 0;

    wss.on("connection", (ws) => {
        if (userCount < 1) {
            console.log('Coinbase ws client connected to server');
            userCount++;
        } else {
            console.log('A user has connected to the server');
        }
        // On listener that listens for messages recieved from the clients
        // If the recieved message is from the Coinbase ws client, that message is then relayed to all other clients connected to the server
        ws.on('message', (data) => {
            const coinbaseKey = 'CoinbaseWS'
            // Catches an unauthorized client's message
            try {
                var extractedKey = Object.keys(JSON.parse(data));
            } catch (error) { 
                console.log('Message sent by unauthorized client')
            }
            // Key authentication to only allow data sent from the Coinbase ws to be relayed
            if (extractedKey == coinbaseKey) {
                // extractedData is data extracted from the message, and then encoded into UTF8 format
                const extractedData = encoder.encode(JSON.parse(data)[extractedKey]);
                wss.clients.forEach((client) => { client.send(extractedData) })
            }
        }
        )
    });
    wss.on('close', () => console.log('User has disconnected'));
}
module.exports = { myWebSocket }