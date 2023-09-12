require('pkginfo')(module)
version = @version

_ = require('underscore')

ironCore = require('iron_core');

class APIClient extends ironCore.Client
  AWS_US_EAST_HOST: 'cache-aws-us-east-1.iron.io'

  constructor: (options) ->
    defaultOptions =
      scheme: 'https',
      host: @AWS_US_EAST_HOST,
      port: 443,
      api_version: 1,
      user_agent: @version()

    super('iron', 'cache', options, defaultOptions, ['project_id', 'token', 'api_version'])

  version: ->
    "iron_cache_node-#{version} (#{super()})"

  url: ->
    super() + @options.api_version.toString() + "/projects/#{@options.project_id}/caches"

  headers: ->
    _.extend({}, super(), {'Authorization': "OAuth #{@options.token}"})

  cachesList: (options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
        
    @get("", options, (error, response, body) ->
      parseResponseBind(error, response, body, cb)
    )

  getCache: (cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)

    @get("/#{cache_name}", options, (error, response, body) ->
      parseResponseBind(error, response, body, cb)
    )

  deleteCache: (cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @delete("/#{cache_name}", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

  clearCache: (cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @post("/#{cache_name}/clear", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

  putItem: (key, cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @put("/#{cache_name}/items/#{key}", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

  IncrementItem: (key, cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @post("/#{cache_name}/items/#{key}/increment", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

  getCacheItem: (key, cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @get("/#{cache_name}/items/#{key}", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

  deleteItem: (key, cache_name, options, cb) ->
    parseResponseBind = _.bind(@parseResponse, @)
  @delete("/#{cache_name}/items/#{key}", options, (error, response, body) ->
    parseResponseBind(error, response, body, cb)
  )

module.exports.APIClient = APIClient
