module.exports =

    name: 'snowball'

    port: process.env.MESH_PORT || 3001

    host: process.env.MESH_HOST || 'localhost'

    dataLayer:

        log_level: 'info|error|warning'
        systemSecret: process.env.MESH_SECRET || 'secret'
        authTokenSecret: process.env.AUTH_TOKEN || 'token'

    endpoints: {}

    modules:

        "webServer":

            path: __dirname + '/web_server'
            constructor:{
                type: 'async'
                name: 'init'
                parameters: [
                    {name: 'config', required: true, value: {host: '41.79.78.18', port: process.env.WEB_PORT || 3000}}
                    {name: 'callback', parameterType: 'callback'}
                ]
                callback:
                    parameters: [
                        {name: 'error', parameterType: 'error'}
                        {name: 'module', parameterType: 'instance'}
                    ]
            }

    components:

        "webserver":
        
            moduleName: 'webServer'
            config: {}
            schema:
                exclusive: true
                methods: 
                    startServer:
                        parameters: [
                            name: "callback" 
                            type: "callback"
                            required: true
                        ]
                        callback:
                            parameters: [
                                {"name":"error", "type":"error"}
                                {"name":"response"}
                            ]
                    stopServer:
                        parameters: [
                            name: "callback" 
                            type: "callback"
                            required: true
                        ]
                        callback:
                            parameters: [
                                {"name":"error", "type":"error"}
                                {"name":"response"}
                            ]

