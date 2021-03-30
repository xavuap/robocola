###

	wisa (toma)-> (dame) ->
		mostra cada mensaje


###

module.exports = (g)-> g.c([]) (comensales)->
	tonal: (a)->
		console.log g.tetas wisa: a.coda
		a.wisa.toma a.coda
		a.sirvo.parlo g.tetas coda: a.coda
	toma: (m) ->
		for c in comensales
			c?.send? m
	camarero: g.c(require("websocket-stream")) (chorro)-> (wisas)->(server)-> (wicha = new ((luisa = require('ws')).Server)(
		server: server
		autoAcceptConnections: false
	)).on "connection", (ws)-> g.c(comensales.push ws) (ene) ->
		# ws.send "conectade"
		ws
			.on "close", ->
				console.log "cerro ws"
				delete comensales[ene-1]
			.on "error", (erro)->
				console.log "erro #{erro}"
			.on "message", (m)->
				g.c(JSON.parse m) (cores)->
					g.mostra cores
					for tone of cores
						wisas[tone]?(cores[tone]) {luisa,wicha,send: ws.send,chorro,ws}
					# switch tone
					# when "anime"
				# ws.send g.tetas recibido: m
				###
				fina
					dame: JSON.parse m
					toma: toma = (m)-> ws.send JSON.stringify m
					re: (m)->
						for comensal in comensales
							comensal.send JSON.stringify m
				###
	comensal: (fina)->
		((cola)->(wisa)->(module)->(booleana)->
			(cn = ()->
				wisa = new WebSocket({
					"http:": "ws://"
					"https:": "wss://"
				}[window.location.protocol] + window.location.host)
				wisa.cola = cola
				wisa.onclose = (event)->
					console.log("close")
					cn()
					#//console.dir(event)
				wisa.onerror = (event)->
					console.log("error")
				wisa.descolar = ->

				wisa.onopen = (evnt)->
					# ee.open()
					# jeto.re?() # (wisa)
					for mode of module
						module[mode].re?()
					wisa.json = (m)-> wisa.send JSON.stringify(m) # borrar #
					for rabo in cola
						wisa.json rabo
					descolar = ->
						if wisa.conectad()
							wisa.json cola.shift()
							descolar()

					# wisa.re?()
					# respuestas?.wisa?.re?() if recola? # borrar #
					# wisa[module].re = respuestas.wisa.re
					# wisa.respuestas = respuestas.wisa
					# for mo of mods wisa[mo].re()
					console.log bt: wisa.binaryType
					console.log "alberto"
					wisa.onmessage = (ev)->
						# jeto.dame JSON.parse ev.data
						if ev.data instanceof Blob
							reader = new FileReader()
							reader.onload = ->
								console.log reader.result
								# location.href = URL.createObjectURL(new Blob([reader.result],type: "video/mp4"))
								window.open(
									URL.createObjectURL(new Blob([reader.result],type: "video/mp4"))
									"_self"
								)
								# location.target = '_blank'
								# // target filename
								# location.download = 'anime.mp4'
							reader.readAsArrayBuffer ev.data
						else
							console.log tata: ev.data
						##jeto = JSON.parse ev.data
						##console.log hola: jeto
						##console.log module: module
						##for mode of jeto
						##	console.log mode: jeto[mode]
						##	module[mode]? jeto[mode]
						# fina.si.dame JSON.parse ev.data
						# wisa.dame JSON.parse ev.data
						# respuestas?.wisa?.dame? (JSON.parse ev.data).encuesta # borrar #
					# fina.toma wisa
				wisa.conectad = ->
					wisa.readyState is WebSocket.OPEN
				# wisa.dame = {}
			)()
			fina?(
				toma: (m) -> 
					# if wisa.conectad()
					# 	# console.log wisa.toma.toString()
					# 	# console.log wisa.toma
					# 	# wisa.toma mo: m
					console.log m
					wisa.send JSON.stringify m
					# else
					# 	cola.push m # (mo:m)
				dame: module
				booleana: booleana
			)
		)([])(null)({})(true)
		# wisa