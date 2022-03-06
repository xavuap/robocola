
	require("../generalas") (g) ->
		g.c(
			arepa: require("../comensal/arepa") g.html
			sheila: require("child_process") # require("shelljs")
			claudia: anime: {}
			dozo: require("./dozo")(g)
			wisa: require("../wisa")(g)
			manifesto: require "../comensal/manifesto"
			# dame: require("./dame")
			# meta: require("./heroku") g
			# dl: require("youtube-dl")
		) (r) -> g.c(
			require("../anime/arepa.anime")(g)(r)
		) (anime) ->
			# console.log {r}
			# console.log claudia: recursos.claudia
			require("./sirvo")
				arepa: (sirvo) ->
					g.c(
						sirvo
						# r: r = recursos
					) switch sirvo.tren[1]
						when "vendor"
							switch sirvo.tren[2]
								when "jquery"
									r.dozo.leer("vendor/jquery-3.4.1.min.js").utf (tetas)->
										sirvo.ecma g.forma(r.claudia)(vendor: jquery: tetas).vendor.jquery
								else
									sirvo.scusa [
										"no vendor"
										sirvo.tren.join(" ")
									].join "\n"
						when "manifesto"
							sirvo.json r.manifesto
						when "imaga"
							r.dozo.leer("imaga.jpg").bin sirvo.jpg
						else
							# sirvo.tren[2] ?= ""
							anime.tonal
							# sirvo.scusa [
							# 	"¿say what?"
							# 	g.tetas sirvo.url
							# ].join "\n"
					# try 
					# 	g.c(
					# 		s: sirvo
					# 		r: recursos
					# 		# c:  # g.batizo(recursos.claudia[sirvo.tren[1]]) -> {}
					# 	) {
					# 		anime: (a)->
					# 			# console.log "anime"
					# 			# console.log claudia: a.r.claudia
					# 			# console.log claudia: a.r.claudia
					# 			# console.log g.tetas r.anime
					# 			g.mostra a.s.url
					# 			a.r.anime.tonal(a)
					# 			# a.sirvo.parlo "anime"
					# 	}[sirvo.tren[1]] ? throw "non parolas #{g.tetas sirvo.url}"
					# catch erro
					# 	sirvo.scusa g.tetas erro
				wisa: r.wisa.camarero
					anime: anime.wisa
				portalt: 8013