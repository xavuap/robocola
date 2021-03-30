
	module.exports = (g)-> ({cheerio})-> g.c(require("request")) (dame)->
		g.c((uri)->(tipa)->({fina,erro})->
			(dame uri, (error,response,body)->
				if error
					console.log erro: error
					null
					erro error
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