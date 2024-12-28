let productIds = [];
function productIdsFetcher() {
  // Each productId is a key that retrieves data from the coinbase WS server

  const request = require('sync-request');
  try {
    const response = request('GET', 'https://api.exchange.coinbase.com/products');
    // Takes the http response's body, and decodes it from a UTF8 string to a json formatted string
    // That json string is then parsed into a js object
    (JSON.parse(response.getBody('utf8')))
    // That object then gets iterated over. The data thats extracted from the iteration is put into an array (productIds[])
      .forEach((object) => productIds.push(object.id));
  } catch (error) {
    console.error('Error:', error);
  }
}
module.exports = { productIdsFetcher, productIds };