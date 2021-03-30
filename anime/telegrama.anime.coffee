#!/usr/local/bin/coffee
	require("../gen") (gen)-> gen (g)-> g.c(
		anime: require("../anime/finas.anime")(g)(require "child_process")
		telebot: new (require "telebot") "1498981044:AAGEziol6CzncUV6Djwi0tmSRxMQUklEfpo"
		dozo: require("../camarero/dozo")(g)
		dame: require("request")			
		digo:  # 📽📽🎥📹📲📼📀
			no: hay: video: (re) -> re(
				g.m "🤔 " + g.suerte(
					"pero eso no es un video"
					"qué dices"
					"¿qué es eso, vale"
					"no entiendo"
					"mándame un video"
					"qué vaina es esa"
					"intenta otra vez"
					"no sé qué dices"
					"á vaina"
					"mielda"
					"nó joda, chico"
					"anda vale, hazlo bien"
					"no vale, ponte seria"
				)
				{asReply: on}
			)
			saludo: ({text})-> text g.m "
				🤖 comparte o pega aquí el video que tú quieras
				y yo lo descargo por ti 📺
			"
			mientras: (re)->
				re g.m "✋🏽 " + g.c(
					"Estoy procesando tu solicitud"
					"Te lo tengo"
					# "Estoy para servirte"
					"Ya lo dijo"
					"Hablao, menor"
					"aguántate ahí"
				) (res...)->
					res[Math.floor Math.random()*res.length]
				re "Pi pu pi pu bib"
		# arepa: (url)-> "http://localhost:#{process.env.PORT ? 5000}/#{url}"
		arepa: (url)-> 
			if on # process.env.PORT?
				"https://#{process.env.HEROKU_APP_NAME}.herokuapp.com/#{url}"
			else
				"http://localhost:#{process.env.PORT ? 8013}/#{url}"
		xavuap: 501726552
	) ({anime,dozo,dame,telebot,digo,arepa,xavuap}) -> g.c(
		meta: require("../camarero/heroku")(g)
			dame: require("../camarero/dame")(g) cheerio: require "cheerio" #.vive()
		efes: ({reply,from})-> g.c(
			fina: ->
				digo.saludo reply
				g.m "enviado a #{from.username}"
		) ({fina})->
			ytdl: (url)->({erro})->
				try
					await reply.video dame g.m arepa url
					fina()
				catch e
					g.mt ytdl: e
					erro() # {url,reply}
			uris: (url)->({erro})->
				try
					await reply.video g.m url
					fina()
				catch e
					g.mt uris: e
					erro() # {url,reply}
	) ({meta,efes})->
		meta.vive(1)
		meta.pulso("toca")(10)
		telebot.start()
		telebot.on "*", (m)-> 
			unless m.from.id is xavuap
				telebot.forwardMessage xavuap, m.from.id, m.message_id 
			if m.text? 
				if m.text in ["/start"]
					digo.saludo m.reply
					# telebot.stop()
				else g.c(
					tetas: m.text.trim()
				) ({tetas})-> g.c(
					tiene: g.has(tetas)
				) ({tiene})-> g.c(
					if not tiene(" ") and tiene(".") and tiene("/")
						url: g.m decodeURIComponent "#{m.text}"
					else {}
				) ({url})-> 
					unless url?
						digo.no.hay.video m.reply.text
					else  g.c(efes m) ({ytdl,uris})->
						digo.mientras m.reply.text
						if not tiene("be")
							g.m "sin be"
							await uris(url) erro: ->
								m.reply.text g.m "🤖 quizá tarde un poco ⏱"
								anime.g(g.m url)
									fina: (uri)->
										g.m guri: uri
										await uris(uri) erro: ->
											m.reply.text g.m "🤖 seguimos trabajando ⏳ por favor espere ⏱"
											await ytdl(url) erro: ->
												m.reply.text g.m "🔧🛠 algo raro pasó aquí ⚙️🔩🧰"
												m.reply.text g.m "📺 por favor intente de nuevo más tarde 📡"
									erro: (e)-> 
										m.reply.text g.m "gerro"
										await ytdl(url) erro: ->
											g.m "lo del enlace"
										# m.reply.text g.m "🔧🛠 algo raro pasó acá ⚙️🔩🧰"
									# sale: (code)->
									# 	digo.saludo m.reply
									# 	g.m "sala"
						else
							g.m "con be"
							m.reply.text g.m "🤖 parece un animado de youtube 📺 quizá tarde un poco ⏱"
							await ytdl(url) erro: ->
								g.m "a enlazar"
							# digo.saludo m.reply		
							# m.reply.text g.t url: "#{e}"
		# telebot.start()
