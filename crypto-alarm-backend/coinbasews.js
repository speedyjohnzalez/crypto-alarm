const { response } = require('express');
const Websocket = require('ws');

function coinbaseModule() {

    const coinbaseEndpoint = ('https://api.coinbase.com/api/v3/brokerage/market/products')
    fetch(coinbaseEndpoint)
        .then(response => response.json())
        .then(cryptoData => {
            //console.log(Object.keys(cryptoData))
            cryptoIds = cryptoData.products.map(cryptoArray => cryptoArray.product_id);
            cryptoNA = cryptoData.products.map(name => ({
                name: name.base_name,
                acronym: name.product_id
            }))
            //console.log(cryptoName)
            const coinbaseSocket = new Websocket('wss://ws-feed.exchange.coinbase.com')
            coinbaseSocket.on('open', () => {
                console.log('Connected to Coinbase WS!');
                coinbaseSocket.send(JSON.stringify({ type: 'subscribe', product_ids: cryptoIds, channels: ['ticker'] }));
                coinbaseSocket.on('message', (data) => {
                    const parsedData = JSON.parse(data);
                    const coinAcronym = parsedData.product_id
                    const price = parsedData.price
                    const time = parsedData.time
                    const matchingCrypto = cryptoNA.find(cryptos => cryptos.acronym === coinAcronym);
                    if (matchingCrypto) {
                        console.log(`Crypto: ${matchingCrypto.name} : ${coinAcronym}, Price: ${price}, Time: ${time}`)
                    }
                    //console.log(`Crypto: ${coinAcronym}, Price: ${price}, Time: ${time}`)
                })
            })
            
        })
}



module.exports = coinbaseModule;