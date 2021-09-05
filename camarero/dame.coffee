
	module.exports = (g)-> ({cheerio,axios})-> g.c(require("request")) (dame)->
		g.c((uri)->(tipa)->({fina,erro})->
			# axios.get uri
			(dame uri, (error,response,body)->
				# .catch (error)->
				if error
					console.log erro: error
					null
					erro? error
				# .then (body)-> # g.c(JSON.stringify body) (body)->
				else
					switch tipa
						when "toca" then fina? body
						when "json"
							try
								fina? JSON.parse body
							catch e
								g.m "#{e}"
								# g.m {body}
								null
								erro? e
						when "xml"
							try
								# g.m dame: body
								# g.mt {fina}
								# g.m cheerio.load
								# g.m cher.text()
								fina cheerio.load(body,null,no)
							catch e
								g.m "#{e}"
								erro? e
			)
		) (dame) -> 
			(url) ->
				toca: dame(url)("toca")
				json: dame(url)("json")
				xml: dame(url)("xml")