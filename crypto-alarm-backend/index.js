const coinbaseModule = require("./coinbase-two-point-o")
const myWS = require("./my-ws")

// Startup my websocket server
myWS.myWebSocket();
// Startup the connection between my websocket server and the coinbase websocket
coinbaseModule.coinbaseModule();