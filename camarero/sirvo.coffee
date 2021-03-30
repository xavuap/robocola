
# llamado por origen
# café origen sirvo
	module.exports = (fina) ->
		console.log "entrego valor"
		# console.log options: fina.options
		# console.log process.env
		server = require("http").createServer(fina.options,(req,res) ->
			# console.log "arepa"
			# console.log "#{por}" for por of req
			# console.log proto: req.headers['x-forwarded-proto']
			console.log
				# ra: req.connection?.remoteAddress
				ip: req.headers["x-forwarded-for"]
				ua: req.headers["user-agent"]
				# rf: req.headers["referer"]
			# console.log req.headers
			# for h in req.headers
			# 	console.log h: h
			if req.headers['x-forwarded-proto'] is 'http' and process.env.PORT? and process.env.PORT isnt 5000 
				#res.redirect 'https://' + req.hostname + req.url
				res.statusCode = 301
				res.setHeader("Location", 'https://' + req.headers.host + req.url)
				# res.writeHead(301, Location: url = 'https://' + req.headers.host + req.url)
				# console.log {url}
				# res.end 301, Location: 'https://' + req.headers.host + req.url
				res.end()
			else
				console.log proto: req.headers['x-forwarded-proto']
				# console.log url: req.url
				fina.arepa( s =
					tren: req.url.split("?").shift().split("/") #.slice(1) # .slice 2
					location:
						pathname: pathname = decodeURIComponent req.url
						origin: "#{req.headers["x-forwarded-proto"]}://#{req.headers.host}"
					url: pathname
					res: res
					bin: (ct)->(parolas)->
						# console.log "sirvio #{req.url}"
						res.setHeader("Access-Control-Allow-Origin", "*")
						res.setHeader('Content-Type', ct)
						res.end(parolas,"binary")
					utf: (ct)->(parolas)->
						# @.sirvo(ct+';charset=utf-8') letras
						# console.log "sirvia #{req.url}"
						res.setHeader("Access-Control-Allow-Origin", "*")
						res.setHeader('Content-Type', ct+';charset=utf-8')
						res.end(parolas)
					adjunto: (nome)->(dozo)->
						res.setHeader(
							'content-disposition'
							"attachment; filename=#{nome}"
						)
						res.end(jeto)
					html: (quetas)->
						@.utf("text/html")("#{quetas}\n")
					parla: (parolas)->
						@.utf("text/plain")(parolas)
						# @.parole(parolas)
					parole: parole = (parolas)->
						@.parla(parolas+"\n")
					parlo: parole
					ecma: (code)->
						@.utf("application/ecmascript")(code)
					coffee: (code)->
						@.utf("application/coffeescript")(code)
					pdf: (pdf)-> @.utf("application/pdf")(pdf)
					###
					café: (coffee)->
						# console.log coffee: coffee
						fina.guanare(coffee) (ecma) => # "(#{coffee.toString()})"
							# console.log ecma: ecma
							s.ecma ecma
					# guanare: (semilla)->(fernanda)->()
					# 	fina.guanare(semilla)(fernanda) (tetas)->
					# 		s[](tetas)
					fichier: (fichas) ->
						@.café fichas # require("../#{fichas}")
					fichero: (fichas) ->
						# console.log fina.dozo.toString()
						fina.dozo.leer.utf("#{fichas}") (parole) =>
							unless parole
								sirvo.scusa "non essiste il ficero"
							else
								@.ecma parole
					capsula: (tripulante)->
						@.ecma "(#{tripulante.toString()})"
					###
					image: (tulip) => (ima) =>
						fina.dozo.leer.bin("#{ima}") (imagen) =>
							unless imagen
								s.scusa "discreto"
							else
								s.bin(tulip)(imagen)
					imaga: 
						png: (fiore) -> s.image("image/png")(fiore)
					#cápsula: (tripulante)->
					#	@.ecma "(#{tripulante.toString()}())"
					# tren: (tren)-> # tetas
					# 	@.café ("(#{wagen})" for wagen in tren).join("")
					css: (stili)->
						@.utf("text/css")(stili)
					png: (image)-> # es{imague}
						@.bin("image/png")(image)
					jpg: (image)->
						@.bin("image/jpeg")(image)
					svg: (victor) ->
						@.utf("image/svg+xml")(victor)
					jpeg: (image)-> @.jpg(image)
					mp4: (anime)->
						@.bin("video/mp4")(anime)
					scusa: (scusa)->
						# 404
						res.statusCode = 404
						# console.error g.tetas {erro}
						@.parole(scusa)
					js: (code)->
						@.ecma code
					txt: (parolas)->
						@.parlo parolas
					json: (jeto)->
						@.utf("application/json") JSON.stringify jeto,null,3
					# scusa: (scusa)->
					# 	@.parlo("cuatro cero cuatro\n#{scusa}\n")
					# 	# res.write("cuatro cero cuatro\n")
					# 	# res.end(scusa+"\n")
					nada: (algo)->
						res.statusCode = 204
						@.parlo("dos cero cuatro\n#{algo}\n")
					trancao: (tranca)->
						res.statusCode = 500
						@.parlo("cinco cero cero\n#{tranca}\n")
				)
				# res.end("con café al aire" + req.url)
		).listen( porto = (process.env.PORT ? fina.portalt ? 80), ->
			fina.wisa?(server)
			console.log( fina.parla?(porto) ? "estamos al aire con café nel #{porto}" )
		)