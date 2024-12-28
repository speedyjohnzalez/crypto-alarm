// Retrieving productIdsFetcher module, and initializing the data.
const productIdsFetcher = require('./product_ids_fetcher')
productIdsFetcher.productIdsFetcher();

function coinbaseModule() {

    // Coinbase websocket url
    const ws = new WebSocket('wss://ws-feed.exchange.coinbase.com');

    // Message sent to retrieve data from the WS (Format on coinbase website)
    const message = {
        type: 'subscribe',
        channels: ['ticker'],
        // Product id's gathered from the productIdsFetcher module
        product_ids: productIdsFetcher.productIds
    }

    // Establishing WS logic. Message is sent to coinbase WS to 'subscribe' to WS
    // After 'subscribing', Coinbase ws server sends data back. The subscription message's parameters are specified on the Coinbase website
    ws.addEventListener('open', (event) => { console.log('Sending subscription message to Coinbase ws server'), ws.send(JSON.stringify(message)) });

    // Establishing connection to personal WS server
    const personalWs = new WebSocket('ws://localhost:8080');

    // Sends data collected from this coinbase ws client to personal ws server
    // Data is attached with a key that identifies messages from the current ws client to the personal ws server
    // All messages sent to the personal ws server require a key to identify the sender
    ws.addEventListener('message', (event) => {
        // console.log(JSON.parse(event.data));
        personalWs.send(JSON.stringify({ 'CoinbaseWS': `${event.data}` }));
    });
}
module.exports = { coinbaseModule }