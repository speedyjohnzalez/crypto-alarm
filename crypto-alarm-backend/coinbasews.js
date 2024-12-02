const Websocket = require('ws')

function coinbaseModule() {
    const coinbaseSocket = new Websocket('wss://ws-feed.exchange.coinbase.com')

    coinbaseSocket.on('open', () => {

        console.log('Connected to Coinbase WS!');

        coinbaseSocket.send(JSON.stringify({ type: 'subscribe', product_ids: ['XLM-USD'], channels: ['ticker'] }));

        coinbaseSocket.on('message', (data) => {
            const parsedData = JSON.parse(data)
            console.log('Recieved data: ', parsedData)
        });
    })
}

module.exports = coinbaseModule;