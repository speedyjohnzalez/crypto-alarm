const { response } = require('express');
const Websocket = require('ws');

function coinbaseModule() {

    const coinbaseEndpoint = ('https://api.coinbase.com/api/v3/brokerage/market/products')
    fetch(coinbaseEndpoint)
        .then(response => response.json())
        .then(cryptoData => {
            //console.log(Object.keys(cryptoData))
            cryptoIds = cryptoData.products.map(cryptoArray => cryptoArray.product_id)
            const coinbaseSocket = new Websocket('wss://ws-feed.exchange.coinbase.com')
            coinbaseSocket.on('open', () => {
                console.log('Connected to Coinbase WS!');
                coinbaseSocket.send(JSON.stringify({ type: 'subscribe', product_ids: cryptoIds, channels: ['ticker'] }));
                coinbaseSocket.on('message', (data) => {
                    const parsedData = JSON.parse(data);
                    const crypto = parsedData.product_id;
                    const price = parsedData.price
                    const time = parsedData.time
                    console.log(`Crypto: ${crypto}, Price: ${price}, Time: ${time}`)
                })
            })
        })
}



module.exports = coinbaseModule;