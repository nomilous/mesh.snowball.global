
Mesh = require 'freebase-mesh'

config = require './config'

module.exports.mesh = mesh = Mesh()

mesh.initialize config, (err) ->

    if err?

        console.log err

        process.exit 1
