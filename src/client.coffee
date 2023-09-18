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
  
  getCache: (cache_name, options, cb) ->
    @api.getCache(cache_name, options, (error, body) ->
      if not error?
        cb(error, body)
      else
        cb(error, body)
    )

  deleteCache: (cache_name, options, cb) ->
    @api.deleteCache(cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  clearCache: (cache_name, options, cb) ->
    @api.clearCache(cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  putItem: (key, cache_name, options, cb) ->
    @api.putItem(key, cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  IncrementItem: (key, cache_name, options, cb) ->
    @api.IncrementItem(key, cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  getItem: (key, cache_name, options, cb) ->
    @api.getItem(key, cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  deleteItem: (key, cache_name, options, cb) ->
    @api.deleteItem(key, cache_name, options, (error, body) ->
      if error == null
        cb(error, body)
      else
        cb(error, body)
    )

  
module.exports.Client = Client
