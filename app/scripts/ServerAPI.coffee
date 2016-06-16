define ['sp-utils-serverclient', 'utils/stub'], (ServerClient, stub)->
  class ServerAPI extends ServerClient
    initialize: ->

    _isServer: -> false #can using stubs

    get_data: ->
      @get {
        url: '/api'
        stub: (async)->
          async.resolve 'stub data'
    	}

    get_news: (data) ->
    	@get {
        url: '/api'
        data
        stub: (async)->
          async.resolve stub.news[data.page]
    	}
