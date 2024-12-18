function myWebSocket() {
    // Code to establish my own Websocket
    const WebSocket = require("ws")
    const wss = new WebSocket.Server({ port: 8080 }, () => console.log('Server created'));
    
    let userCount = 0;

    wss.on("connection", (ws) => {
        
        if (userCount < 1) {
            console.log('Server has connected to Coinbase WS');
            userCount++;
        } else {
            console.log('A user has connected to the server')
        }
        ws.on('message', (data) => {
            // console.log(data)
            wss.clients.forEach((client) => { client.send(data) });
        });
        wss.on('close', () => console.log('User has disconnected'));

    }
    )
}
module.exports = { myWebSocket }