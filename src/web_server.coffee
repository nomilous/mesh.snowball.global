module.exports.init = ({port, host}, callback) ->

    express = require 'express'

    app = express()

    app.get '/', (req, res) -> res.sendStatus 200

    server = app.listen port, host, ->

        callback null, 

            startServer: (callback) ->

                console.log 'start'

                server = app.listen port, host, ->

                    callback null, 'started'

            stopServer: (callback) ->

                console.log 'stop'

                server.close ->

                    callback null, 'stopped'
