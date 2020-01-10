const csv = require('csv-parser');
const fs = require('fs');
require('newrelic');
const express = require('express')
const bodyParser = require('body-parser')
const app = express()
const port = 3000
const db = require('./db')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({
    extended: true,
}))
const redis = require("redis"),
    cache = redis.createClient({
        host: 'redis'
    });
cache.on("error", function (err) {
    console.log("Error " + err);
});
// app.get('/loaderio-a9b96e566e83ea103824b022d25a1116', (request, response) => {
//     response.send('loaderio-a9b96e566e83ea103824b022d25a1116')
// })

app.get('/products/list', (request, response) => {
    db.getProductList(request.query.page, request.query.count)
        .then((results) => response.json(results))
        .catch((err) => response.json(err))
})

app.get('/products/:product_id', (request, response) => {
    db.getProductByID(request.params.product_id)
        .then((results) => response.json(results))
        .catch((err) => response.json(err))
})

app.get('/products/:product_id/styles', (request, response) => {
    db.getStyleByProductID(request.params.product_id)
        .then((results) => response.json(results))
        .catch((err) => response.json(err))
})

app.get('/products/:product_id/related', (request, response) => {
    db.getRelatedProducts(request.params.product_id)
        .then((results) => response.json(results))
        .catch((err) => response.json(err))
})
app.listen(port, () => {
    console.log(`App running on port ${port}. http://localhost:${port}`)
})