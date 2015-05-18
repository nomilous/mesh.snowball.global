module.exports.init = ({port, host}, callback) ->

    express = require 'express'

    app = express()

    app.get '/', (req, res) -> res.send "Humpty Dumpty looked doubtful. 'I'd rather see that done on paper,' he said."

    server = app.listen port, host, ->

        running = true

        callback null, 

            startServer: (callback) ->

                return callback null, 'Already running' if running

                console.log 'start', new Date

                server = app.listen port, host, ->

                    running = true

                    callback null, 'STARTED web server at http://mesh.snowball.global'

            stopServer: (callback) ->

                return callback null, 'Already stopped' unless running

                console.log 'stop', new Date

                server.close ->

                    running = false

                    callback null, 'STOPPED web server at http://mesh.snowball.global'
