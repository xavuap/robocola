
	module.exports = (g)->(r)->
		# 
		# g.c()
		finas: f =
			chorro: (url)->(pro)->
				r.sheila.spawn("anime/youtube-dl",["-o", "-", url]).stdout.pipe(pro)
			o: (url)->
				r.sheila.spawn("anime/youtube-dl",["-o", "-", url]).stdout
			json: (url)->(p)-> g.claudias(p) (erro)-> (bien)-> (fina)-> # pro
				# g.mostra json: url: url
				r.sheila.execFile(
					"./youtube-dl"
					["-j",url]
					(e,o,r)->
						# g.mostra {e,o,r}
						# g.mostra json: g.tetas o
						fina(
							try
								bien JSON.parse o # "(#{o})"
							catch
								erro r
						)
				)
		wisa: (url)->(ws)->
			#  r.sheila.spawn("./youtube-dl",["-o", "-", url]).stdout
			g.mostra wisa: url
			g.mostra typeof url
			# ws.luisa.createWebSocketStream(ws.wicha).pipe r.sheila.spawn("./youtube-dl",["-o", "-", url]).stdout
			# f.chorro(url)(ws.send)
			f.chorro(url) ws.chorro(ws.ws)
			# f.chorro(url)(ws)
		tonal: (sirvo)->
			g.c( l =
				coda: sirvo.url.split("/").slice(2).join("/")
				url: sirvo.url.slice(1)
				# claudia: g.batizo(a.c.anime.tonal) -> {}
			) (l)->
				g.mostra uri: sirvo.url
				g.mostra coda: l.coda
				g.mostra url: l.url
				switch sirvo.tren[1]
					when "toca"
						sirvo.parla "tocada"
					when "json","info"
						f.json(l.coda)
							erro: (erro)-> sirvo.scusa erro
							bien: (json)->
								# g.mostra {json}
								json
							fina: (json) ->
								sirvo.json json
					when "dame", "save", "download", "store"
						# l.chorro()
						f.json(l.coda)
							erro: (erro)-> # sirvo.scusa erro
								"#{new Date().getTime()}.mp4"
							bien: (json)-> 
								json._filename
							fina: (nome) ->
								sirvo.res.setHeader(
									'content-disposition'
									"attachment; filename=#{nome}"
								)
								# g.mostra {json}
								# sirvo.json json.formats
								# a.r.sheila.spawn("./youtube-dl",["-o", "-", l.coda]).stdout.pipe(sirvo.res)
								f.chorro(l.coda)(sirvo.res)
					when "mostra", "show", "watch", "view", "play"
						sirvo.res.setHeader("Content-Type","video/mp4")
						f.chorro(l.coda)(sirvo.res)
						# a.r.sheila.spawn("./youtube-dl",["-o", "-", l.coda]).stdout.pipe(sirvo.res)
					when "html", "arepa", ""
						# console.log claudia: a.c.anime.tonal
						# console.log anime: a.r.claudia
						# sirvo.html a.r.claudia.anime ? a.r.claudia.anime = g.c() ->
						sirvo.html g.nalgas(r.claudia.anime) "arepa": ->
							console.log "uma soa"
							r.arepa
								nimi: "🎦⏬"
								toki: "es"
								manifesto: "manifesto"
								icono: (html)-> html(
									link: null
									rel: "icon"
									type: "image/jpeg" # "svg+xml" # 
									href: "" # "#{sirvo.location.origin}/sverige/palmita"
								) null
								#css: [
								#	"#{sirvo.location.origin}/vendor/spin/css"
								#]
								ecma: [
									# {src: "#{sirvo.location.origin}/vendor/spin/js"}
									# {content: [ g.capsulas() require("../vendor/spin/spin.coffee")]}
									{src: "#{sirvo.location.origin}/vendor/jquery"} # "#{sirvo.location.origin}/vendor/jquery"}
									{
										content: g.capsuladas(
												wisa: null # r.wisa.comensal
												h: (fina)-> fina h = 
													cero: 
														padding: "0"
														margin: "0"
														border: "none"
													uno: 
														fontFamily: "mono"
														fontSize: "3.5vmin"
														color: "#444444"
														textShadow: "0.1vmin 0.1vmin #BBBBBB"
													tag: (queta)->
														$(document.createElement(queta))
															.addClass "anime"
															.css h.cero
															.css h.uno
													sombra: "0 0.1vmin 1vmin gray"
													flex: (queta)->
														h.tag queta
															.css h.css.flex
													css:
														flex:
															display: "flex"
															placeContent: "center"
															alignItems: "center"
													tone: (nome)->
														h.tag "table"
															.css
																boxShadow: h.sombra
																padding: "2vmin 2vmin"
																width: "9vmin"
																textAlign: "center"
																borderRadius: "1vmin"
																# fontFamily:
																cursor: "pointer"
																userSelect: "none"
															.text nome # "\uF09F\u8CA0" # "\u1F320" # "\uF09F\u8CA0" # "\xE2\x86\x99"
															.mousedown -> $(@).css boxShadow: h.sombra+" inset"
															.mouseup -> $(@).css boxShadow: h.sombra
												l: (fina)-> fina l =
													url: window.location.origin
													ton: ->
													f:
														dame: ->
															if (url = $("textarea.anime.url").val()) isnt ""
																window.open(
																	[l.url,"dame",url].join("/")
																	# "_blank"
																)
															else
																console.log "nada"
													s: s =
														pasta: "\uD83D\uDCCB" # co # hai
														limpia: "\uD83D\uDEBD" # 
														enlace: "\uD83D\uDD17" # rel
														vedere: "\uD83D\uDCFA" # video
														stella: "\uD83C\uDF20"
														memo: "\uD83D\uDCDD"
														pencil: "\u270F"
														keyboard: '⌨'
														film: "🎞"
														broom: "🧹"
														euro: "\uD83D\uDCB6"
														gbp: "\uD83D\uDCB7"
														card: "\uD83D\uDCB3"
														yen: "\uD83D\uDCB4"
														peso: "\uD83D\uDCB5"
														lucas: "\uD83D\uDCB0"
														pú: "\uD83D\uDCA9"
														speech: "\uD83D\uDCAC"
														down: "⬇"
														fd: "⏬"
														dw: "🔽"
														rtd: "🔻"
														cicl: "♻"
													omi: ["",s.pasta,s.enlace,s.vedere,""].join(" ") # " \uD83D\uDCCB \uD83D\uDD17 \uD83D\uDCFA "
										) (wisa)-> (h)-> h (h)-> (l)-> l (l)->
											$(document).ready ->
												$("body")
													.css h.cero
													.css h.uno
													.css h.css.flex
													.css
														backgroundColor: "#DDDDDD"
														# backgroundColor: "#EEEEEE"
														height: "100vh"
													.append [
														h.flex "div"
															.css
																flexFlow: "row wrap"
																justifyContent: "space-evenly"
																alignContent: "space-evenly"
																backgroundColor: "#EEEEEE"
																height: "30vmin"
																width: "90vmin"
																# padding: "5vh 5vw"
																boxShadow: h.sombra
																borderRadius: "3vmin"
															.append [
																h.flex  "div"
																	.addClass "visión"
																	.css
																		flexFlow: "column wrap"
																		justifyContent: "space-evenly"
																		# backgroundColor: "#EEEEEE"
																		height: "#{64*5/8}vmin"
																		alignContent: "space-evenly"
																		width: "80vmin" # "90vw"
																		# boxShadow: h.sombra
																	.append [
																		h.tag "div"
																			.css
																				width: "64vmin"
																				height: "#{64*5/8}vmin"
																				boxShadow: "#{h.sombra} inset"
																				borderRadius: "2vmin"
																				backgroundColor: "#CCCCCC"
																	]
																	.hide()
																h.flex "textarea"
																	.addClass "anime url"
																	.attr
																		placeholder: l.omi
																		autofocus: true
																		rows: 1
																	# 	contenteditable: true
																	# 	# type: "text"
																	.css
																		width: "81vmin"
																		verticalAlign: "middle"
																		resize: "none"
																		overflow: "auto"
																		whiteSpace: "nowrap"
																		# height: "8.5vmin"
																		padding: "2vmin" # "0.5em 1em"
																		backgroundColor: "#EEEEEE"
																		boxShadow: "#{h.sombra} inset"
																		borderRadius: "1vmin"
																	.keydown (e)->
																		if e.which is 13
																			e.preventDefault()
																			l.f.dame()
																	# .text l.omi # " \uD83D\uDCCB \uD83D\uDD17 \uD83D\uDCFA " # "~ .. ~"
																	# .focusin ->
																	# 	if $(@).text() is l.omi
																	# 		$(@).text("")
																	# .focusout ->
																	# 	if $(@).text() is ""
																	# 		$(@).text(l.omi)
																h.tone(l.s.limpia)
																	.click ->
																		$("textarea.anime.url").val("")
																h.tone(l.s.memo)
																	.click ->
																		$("textarea.anime.url").focus()
																h.tone(l.s.pasta)
																	.click ->
																		$("textarea.anime.url").val await navigator.clipboard.readText()
																h.tone(l.s.fd)
																	.click l.f.dame
															]
													]
												# b = true
												a = {b: true}
												wisa? (w)->
													# w.dame (m)->
													if a.b # w.booleana
														# w.booleana = false
														a.b = false
														console.log voy: "https://www.youtube.com/watch?v=tPEE9ZwTmy0"
														w.toma anime: "https://www.youtube.com/watch?v=tPEE9ZwTmy0"
												# await navigator.clipboard.readText()
												# await = "hola"
									}
									# {src: "#{sirvo.location.origin}/finsa/comensal"}
								]
						# sirvo.parlo "anime"
					else
						f.json(l.url)
							erro: (erro)-> # sirvo.scusa erro
								"#{new Date().getTime()}.mp4"
							bien: (json)-> 
								json._filename
							fina: (nome) ->
								sirvo.res.setHeader(
									'content-disposition'
									"attachment; filename=#{nome}"
								)
								f.chorro(l.url)(sirvo.res)
		###
		g.c(require "youtube-dl") (dl)-> g.c( 
			(url)-> (v)-> # g.claudias(v) (fina)-> (scusa)->
				try
					g.c(dl url) (anime) ->
						anime.on "info", v.info ? ->
						v.fina anime
				catch erro
					console.log erro
					v.scusa erro
		) (anima) ->
			tonal: (a) ->
				# console.log parola: a.s.tren[2]
				g.c(
					coda: a.s.url.split("/").slice(3).join("/")
					# claudia: g.batizo(a.c.anime.tonal) -> {}
				) {
					null: (l)->
						# console.log claudia: a.c.anime.tonal
						# console.log anime: a.r.claudia
						# a.s.html a.r.claudia.anime ? a.r.claudia.anime = g.c() ->
						a.s.html g.nalgas(a.r.claudia.anime) "": ->
							console.log "uma soa"
							a.r.arepa
								nimi: "robocola"
								toki: "es"
								icono: (html)-> html(
									link: null
									rel: "icon"
									type: "svg+xml" # "image/jpeg"
									href: "" # "#{a.s.location.origin}/sverige/palmita"
								) null
								#css: [
								#	"#{a.s.location.origin}/vendor/spin/css"
								#]
								ecma: [
									# {src: "#{a.s.location.origin}/vendor/spin/js"}
									# {content: [ g.capsulas() require("../vendor/spin/spin.coffee")]}
									{src: ""}# "#{a.s.location.origin}/vendor/jquery"}
									# {content: g.capsulas() -> alert "hola"}
									# {src: "#{a.s.location.origin}/finsa/comensal"}
								]
						# a.s.parlo "anime"
					dame: (l) ->
						console.log coda: l.coda
						anima(l.coda)
							info: (info)->
								console.log info
								# console.log
								# 	format: info.format
								# 	formats: g.tetas info.formats
								a.s.res.setHeader(
									'content-disposition'
									"attachment; filename=#{info._filename}"
								)
							fina: (anime)->
								anime.pipe(a.s.res)
							scusa: (erro)->
								a.s.scusa g.tetas erro
					mostra: (l) ->
						anima(l.coda)
							fina: (anime)->
								anime.pipe(a.s.res)
							scusa: (erro)->
								a.s.scusa g.tetas erro
				}[{
					undefined: null
					"": null
					dame: "dame"
					mostra: "mostra"
				}[a.s.tren[2]]] # ? throw "¿fare ché?"
		###