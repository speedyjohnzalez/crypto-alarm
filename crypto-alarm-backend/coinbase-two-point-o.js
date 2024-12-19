function coinbaseModule() {
    // Websocket URL
    const wsURL = 'wss://ws-feed.exchange.coinbase.com'
    const ws = new WebSocket(wsURL);
    
    // Message sent to retrieve data from the WS (Format on coinbase website)
    const message = {
        type: 'subscribe',
        channels: ['ticker'],
        product_ids: ['XLM-USD']
    }

    // Establishing connection to personal WS server
    const serverURL = 'ws://localhost:8080'
    const personalWs = new WebSocket(serverURL);

    // Establishing WS logic
    ws.addEventListener('open', (event) => { console.log('Coinbase WS initialized'), ws.send(JSON.stringify(message)) });
    ws.addEventListener('message', (event) => {
        // console.log(event.data);
        personalWs.send(event.data);
    });
}

// Exports the data stored
module.exports = { coinbaseModule }