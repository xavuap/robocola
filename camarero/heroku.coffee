

	module.exports = (g)-> ({dame})->g.c(
		nimi: process.env.HEROKU_APP_NAME
		kinds:
			carulosu:
				token: "6c0a007e-36f2-4e96-9407-9f0f99dc04ef"
				horario: ({semanario,mes})-> 
					#mes isnt "febrero" and 
					# mes is "marzo" or 
					not (51630 > semanario > 1705)
					no
				hosts: 
					robocolo: "robocola"
					auyama: "radicalia"
					yaguara: "araugay"
					carulosu: "usolurac"
			xavuap:
				token: "a00b0637-fae6-42e0-8829-2a3604d315fa"
				horario: ({semanario,mes})-> 
					# mes is "febrero" or not 
					(51630 > semanario > 1705)
					no
				hosts:
					robocola: "robocolo"
					radicalia: "auyama"
					araugay: "yaguara"
					usolurac: "carulosu"
			morosudo:
				token: "e93f8b23-2561-4c10-bfa7-1b30290d82c8"
				horario: ({mes})-> mes is "abril" # "marzo"
				hosts:
					morosudo: "carulosu"
					robocoli: "robocola"
					cambur: 
		local: not process.env.NODE_HOME?
	) ({nimi,kinds,local})-> g.c(
		nome: nimi
		gente: (ki)-> g.c(
			heroku: new (require("heroku-client"))
				token: g.s("token") g.s(ki) kinds
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
					body: g.m updates: for p of gente then {type:p,quantity: gente[p]} # [{type:type,quantity:1}]}
				}).then [fina,erro]...
			# scale: ->
		url: (porto)->
			if local
				"http://localhost:#{porto}"
			else
				"https://#{nimi}.herokuapp.com"
		familia: g.c() ->
			for ki in kinds
				if nome in kinds[ki].hosts
					return ki
	) ({nome,gente,url,familia})-> g.c(
		duerme: ({kind,gente,puedo})->
			for host of kinds[kind].hosts
				gente(host).presta(web:0,bot:0)
					fina: (re)->
						g.m "#{host} dormido"
					erro: (er)->
						g.m {er}
						g.m "no se durmió #{host}"
						g.pera(60*1000) ->
							puedo()
	) ({duerme})->
		gente: gente
		nome: nome
		familia: familia
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
		vive: -> g.c(
			hogar: gente(familia)
		) ({hogar})->
			g.cronica(10*60*1000) g.r (puedo)-> -> g.tempo(hora: -4) (tempo)->
				for kind of kinds
					unless nome of kinds[kind].hosts
						unless kinds[kind].horario(tempo)
							duerme
								kind: kind
								gente: hogar
					else
						reino = kind
				unless kinds[reino].horario(tempo)
					duerme
						kind: reino
						gente: hogar
				else puedo()
		viv: (horas)-> unless local then g.c(
			(ki)-> 
				g.c(Object.entries(ki)[0]) ([quién,nombre])-> {
					nome: nombre
					horario: g.s("horario") g.s(quién) kind
					gente(quién)(nombre)...
				}
		) (ki)-> g.c(
			me: if nome of kind.morosudo.hosts then ki {morosudo: nome} else if nome of kind.carulosu.hosts then ki {carulosu: nome} else ki {xavuap: nome}
			tu: if nome of kind.morosudo.hosts then ki {carulosu: kind.morosudo.hosts[nome] } else if nome of kind.xavuap.hosts then ki {carulosu: kind.xavuap.hosts[nome]} else ki {xavuap: kind.carulosu.hosts[nome]}
			# le: if nome of kind.
			# me: 
		) ({me,tu})->
			g.m me: me.nome
			g.m tu: tu.nome
			g.cronica(horas*60*60*1000) g.r (puedo)-> ->
				g.tempo(hora:-4) ({feira,reloj,semanario,mes})->
					g.m {semanario,mes}
					# if tu.horario {semanario,mes}
					if me.horario {semanario,mes}
						tu.presta(bot: 0)
							fina: (re)->
								g.m "#{tu.nome} dormido"
							erro: (er)->
								g.m {er}
								g.m "algo mal en meta else"
								g.pera(60*1000) ->
									puedo()
					else
						tu.presta(bot: 1)
							fina: (re)->
								# g.m {re}
								g.m "todo bien"
								# if no
								me.presta(bot: 0) # , web:0)
									fina: (re)->
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