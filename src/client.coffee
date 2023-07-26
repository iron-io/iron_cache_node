_ = require('underscore')

apiClient = require('./api_client')

class Client
  constructor: (options) ->
    @api = new apiClient.APIClient(options)

  cachesList: (options, cb) ->
    @api.cachesList(options, (error, body) ->
      if not error?
        cb(error, body)
      else
        cb(error, body)
    )  
  
  getCache: (cb) ->
    @api.getCache(@api.options.cache_name, (error, body) ->
      if not error?
        cb(error, body)
      else
        cb(error, body)
    )
  
module.exports.Client = Client
