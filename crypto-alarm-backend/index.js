const coinbaseModule = require('./clients/coinbase-client')
const myWS = require('./servers/my-ws')

// Startup my websocket server
myWS.myWebSocket();
// Startup the connection between my websocket server and the coinbase websocket
coinbaseModule.coinbaseModule();