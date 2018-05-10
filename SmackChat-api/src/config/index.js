import mongodb from 'mongodb';

export default {
  "port": 3005,
  "mongoUrl": "mongodb://localhost:27017/chat-api",
  //"port": process.env.PORT,
  //"mongoUrl": "mongodb://alishgiri:password@ds217350.mlab.com:17350/smackchat",
  "bodyLimit": "100kb"
}
