

	module.exports = (g)-> ({dame})->g.c(
		nimi: process.env.HEROKU_APP_NAME
		kind:
			carulosu:
				token: "6c0a007e-36f2-4e96-9407-9f0f99dc04ef"
				horario: ({semanario,mes})-> 
					#mes isnt "febrero" and 
					# mes is "marzo" or 
					# no
					(51630 > semanario > 1705)
				hosts: 
					robocolo: "robocola"
					auyama: "radicalia"
					# yaguara: "araugay"
					# carulosu: "usolurac"
			xavuap:
				token: "a00b0637-fae6-42e0-8829-2a3604d315fa"
				horario: ({semanario,mes})-> 
					# mes is "febrero" or not 
					# no
					not (51630 > semanario > 1705)
				hosts:
					robocola: "robocolo"
					radicalia: "auyama"
					# araugay: "yaguara"
					# usolurac: "carulosu"
			morosudo:
				token: "e93f8b23-2561-4c10-bfa7-1b30290d82c8"
				horario: ({mes})-> no # mes is "abril" # "marzo"
				hosts:
					# morosudo: "carulosu"
					robocoli: "robocola"
					cambur: ["radicalia","auyama"]
		local: not process.env.NODE_HOME?
	) ({nimi,kind,local})-> g.c(
		nome: nimi
		gente: (ki)-> g.c(
			heroku: new (require("heroku-client"))
				token: g.s("token") g.s(ki) kind
		) ({heroku})-> (nome=nimi)->
			refresco: (dyno="")->({fina,erro})-> # (fina)->(erro)->
				heroku.delete("/apps/#{nome}/dynos/#{dyno}").then [fina,erro]...
			para: (dyno="web")->({fina,erro})->
				heroku.post(
					"/apps/#{nome}/dynos/#{dyno}/actions/stop"
				).then [fina,erro]...
			dale: (type="web")-> ({fina,erro})->
				heroku.patch("/apps/#{nome}/formation/#{type})",{body: quantity: 1}).then [fina,erro]...
			sale: (type="web")->({fina,erro})->
				heroku.patch("/apps/#{nome}/formation/#{type})",{body: quantity: 0}).then [fina,erro]...
			lista: ({fina,erro})->
				heroku.get("/apps/#{nome}/formation").then [fina,erro]...
			presta: (gente)->({fina,erro})->
				heroku.patch("/apps/#{nome}/formation",{
					#g.m v
					body: updates: for p of gente then {type:p,quantity: gente[p]} # [{type:type,quantity:1}]}
				}).then [fina,erro]...
			# scale: ->
		url: (porto)->
			if local
				"http://localhost:#{porto}"
			else
				"https://#{nimi}.herokuapp.com"
	) ({nome,gente,url})-> 
		gente: gente
		nome: nome
		version: process.env.HEROKU_RELEASE_VERSION
		url: url
		local: local
		pulso: (dónde)->(min)->
			unless local
				g.cronica(min*60*1000) g.r (vive)-> ->
					g.m "esperando"
					g.tempo(hora:-4) ({semanario})->
						# if semanario < 1705 or semanario > 51630
						dame("#{url()}/#{dónde}").toca erro: ->
							g.m "tocando"
							g.pera(60*1000) vive
		vive: (horas)-> 
			# for ki of kind
			# 	# kind[ki].gente = gente(ki)
			# 	# argo fina llave jeto
			# 	g.valeria(kind[ki])("gente")(ki)(gente)
			# 	# g.valeria(kind)(ki)(ki)(gente)
			g.cronica(horas*60*60*1000) -> # g.r (puedo)->
				g.tempo(hora:-4) (horario)->
					# for ki of kind
					g.c(Object.keys(kind)...) g.r (fina)-> (ki,kinds...)-> 
						fina kinds... if kinds.length
						g.valeria(kind[ki])("gente")(ki)(gente)
						# g.mostra g.n(ki) g.tetas kind[ki].gente
						g.c(kind[ki].horario horario) (horario)->
							# for fio of kind[ki].hosts
							g.c(Object.keys(kind[ki].hosts)...) g.r (nesta)-> (fio,fios...)->
								# g.m g.n(ki) fio
								unless fio is nome #  horario and 
									kind[ki].gente(fio).presta( bot: g.s(horario) {true:1,false:0} )
										fina: (re)->
											if horario
												g.m "revisame en #{fio} de #{ki}"
											else
												g.m "#{fio} de #{ki} dormido"
											nesta fios... if fios.length
										erro: (er)->
											g.m {er}
											g.m "algo mal en #{fio} de #{ki}"
											g.pera(60*1000) ->
												nesta fio,fios...
												# puedo()
			if no then g.cronica(horas*60*60*1000) g.r (puedo)-> ->
				g.tempo(hora:-4) ({feira,reloj,semanario,mes})->
					g.m {semanario,mes}
					# if tu.horario {semanario,mes}
					if me.horario {semanario,mes}
						tu.presta(bot: 0)
							fina: (re,tu)->
								g.m "#{tu.nome} dormido"
							erro: (er)->
								g.m {er}
								g.m "algo mal en meta else"
								g.pera(60*1000) ->
									puedo()
					else
						vi(bot: 1)
							fina: (re)->
								# g.m {re}
								g.m "todo bien"
								# if no
								me.presta(bot: 0) # , web:0)
									fina: (re,tu)->
										g.m "adiós"
										g.m "revisame en #{tu.nome}"
										# telebot.stop()
										# fina(re)
									erro: (er)->
										g.m {er}
										puedo()
										# erro(er)
							erro: (er)->
								g.m {er}
								g.m "algo mal en meta"
								g.pera(60*1000) ->
									puedo()
								# erro(er)