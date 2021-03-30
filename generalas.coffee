
	module.exports = (fina)-> fina g =
		enfilar: enfilar = (arreglo)-> # [prima,seconda,terza] -> prima: seconda: terza 	# prima:seconda:terza
			if arreglo.length > 1
				"#{arreglo.shift()}": enfilar(arreglo)
			else
				arreglo.shift()
		consultar: (arreglo)-> # [prima,seconda,terza] -> prima[seconda][terza] # prima.seconda.terza
			((arre)->
				if arreglo.length
					@.consultar(arreglo)[arre]
				else
					arre
			)(arreglo.pop())
		caminos: camila = (campo) -> # {prima: seconda: terza: quarta} -> [[prima,seconda,terza,quarta]]# arreglo bidimensional con todos los caminos
			salida = []
			for champ of campo
				if typeof campo[champ] is "object"
					for moi in camila(campo[champ])
						salida.push [champ].concat(moi)
				else
					salida.push [champ,campo[champ]]
			salida
		dotNotation: (campos)-> # {prima: seconda: terza: quarta} -> {"prima.seconda.terza": quarta}
			salida = {}	
			for cada in @.caminos(campos)
				cola = cada.pop()
				salida[cada.join(".")] = cola
			salida
		compa: (patria)->(alien)-> # nazi, residente, terrícola, conservador # visitante, extranjero extraterrestre, heterogéneo #
			for ala of alien
				if typeof alien[ala] is "object" and patria[ala]?
					compa(patria[ala])(alien[ala])
				else
					if patria?[ala] is alien[ala]
						delete patria[ala]			# borra de patria los comunes con alien
		tabulas: ->
		solo: (tren) -> (a)->
			(index)->(fina)->
				console.log {
					index
					tren
				}
				if tren[index+1] in [undefined,""] and tren[2+index] is undefined
						(fina ? a?.scusa) tren # 
				else
					a?.scusa? tren
					# sirvo.scusa g.tetas scusa: sirvo.tren
		html: (atr)->(content)->(tablas="")->
			###
				content
					undefined
						<!DOCTYPE html>
					null
						<link rel="icon" />
					""
						<body></body>
					[]
						<script>
						</script>
					"hola"
						<title>hola</title>
					["tablo"]
						<>
							tablo
						</>
					["lista",html(ul:null)]
						<li>
							lista
							<ul>
						</li>
			###
			props = []
			for prop of atr
				props.push(
					if atr[prop]?
						"#{prop}=\"#{atr[prop]}\""
					else
						prop
				)
			cierre = "</#{props[0]}>" 
			# cierre if content? # and not content?.length # typeof content
			[
				#'\xa0' unless props.length
				"<#{props.join(' ')}#{ (" /" if content is null) ? "" }>#{ {string:content+cierre}[typeof content] ? "" }" if props.length
				( (("\t" if props.length) ? "\t" ) + tablas + (conteudo?(tablas+"\t") ? "\t"+conteudo) for conteudo in content).join("\n") if content? and content.length and typeof content isnt "string"
				tablas+cierre if props.length and Array.isArray(content)
				# '\xa0' unless props.length
			].filter(Boolean).join("\n")
		###
		cerrojo: (fina)-> # ejecuta a fina una sola vez Y guarda el resultado para reusar
			( (llaves)->
				(argo)->
					llaves[argo] ? llaves[argo] = fina(argo)
			) {}
		# llaves: -> # no entiendo el anterior # ^
		# candado: cerrojo (a)-> a
		candado: (llaves)-> # g.c({}) (llaves) ->
			(llave) -> (fina) ->
				llaves[llave] ? llaves[llave] = fina(llave)
		llavín: (fina) -> g.c(null) (llave) -> # (argo) ->
			llave ? llave = fina
		josefina: (prima)-> g.c({}) (llaves)-> (argo)-> (fina)->
			if llaves[argo]?
				console.log "josefina hai #{argo}"
				fina llaves[argo]
			else
				prima(argo) (valeria) ->
					fina llaves[argo] = valeria
		algos: (finas)-> g.c({}) (llaves)-> (llave)-> # (fina)->
			if llaves[llave]?
				llaves[llave] # fina
			else
				llaves[llave] = finas[llave]()
		batizo: (clave)->(aura)->
			console.log "#{clave} ? clave = #{g.tetas aura()}"
			clave ? clave = aura()
		###
		nalgas: (claudia)->(valeria)->
			#
			for val of valeria
				claudia[val] ? claudia[val] = valeria[val]()
			claudia[val]
			#
		forma: (pattern)->(matters)->
			for ma of matters
				if pattern[ma]? and typeof pattern[ma] is "object"
					g.forma(pattern[ma])(matters[ma])
				else
					pattern[ma] = matters[ma]
			pattern
		gracia: ->
		# 	salida = {}
		# 	for pa of matters
		# 		if 
		puede: (booleanas)->(finas)->(fruto)->
				console.log fruto: fruto
				for fruta of fruto
					booleanas[fruta] = fruto[fruta]
					booleana = booleanas[fruta]
					for lana of booleanas
						unless booleanas[lana]
							booleana = false
							break
						else
							booleana = booleana and booleanas[lana]
					if booleana
						finas.true?() # spin.stop()
					else
						finas.false?()
				console.log booleanas
		claudia: claudia = (claudia)->(fina)-> fina?(claudia)
		c: claudia
		juana: (fina)-> claudia(true) (b)-> (argos)-> # unica #
			if b
				fina(argos)
				b = false
		claudias: (argos)->(fina)->
			for argo of argos
				fina = fina argos[argo]
			fina
		# mostra: (algo)->
		# 	console.log mostra: (mostra = (algo)-> {
		# 			string: -> algo
		# 			object: ->
		# 				for some of algo
		# 					salida = "#{some}:\n\t#{mostra algo[some]}"
		# 				salida ? algo
		# 			function:-> algo.toString()
		# 		}[typeof algo]?() ? "mostra tipa"
		# 	) algo
		#
		# no sé qué es eso ^
		mostra: (argo) ->
			console.log argo
			argo
		janes: (modos)->(fina)-> # janes (wisa: req("wisa", susa: req ('susa'))) (jetos) -> for jeto of jeto #
			# console.log {modos}
			g.c({}) (jeto)-> (jane = (ari)->
				# console.log {ari}
				g.c(ari.shift()) (mods) ->
					for mod of mods
						if ari.length is 0 
							mods[mod] (algo)->
								jeto[mod] = algo
								fina jeto
						else
							mods[mod] (algo)->
								jeto[mod] = algo
								jane ari
				) (
					for mo of modos
						# console.log mo: "#{mo}": modos[mo]
						"#{mo}": modos[mo]
				)
			# todas las finas en una # con todos los argumentos en un objeto #
		cronica: (tempo)-> refina = (fina)->
			fina()
			setTimeout((-> refina fina ),tempo)
		lock: (lock)-> (booleana)->
			if booleana?
				lock
			else
				lock = booleana
		hache: (jan)->(h)->
			jan.split(jan).join(h)
		tetas: (jeto)-> 
			"#{(tetas = (jeto)->
				{
					string: -> "\"#{jeto}\""
					function: ->
						jeto.toString()
					object: ->
						if jeto?
							{
								true: ->
									"[#{(tetas sign for sign in jeto).join(",")}]"
								false: -> 
									"{#{(
										for sign of jeto
											"#{sign}: #{tetas jeto[sign]}"
									).join(",")}}"
							}[Array.isArray jeto]()							
						else
							jeto
				}[typeof jeto]?() ? jeto
			)(jeto)}"
		capsula: (tripula)->
			"(#{g.tetas(tripula)})"
		capsulas: (argos)-> (fina)->
			g.claudias(
				argos: g.tetas argos
				finas: g.tetas(fina)
			) (argos)-> (finas)-> {
					function: -> "(#{finas})(#{argos})"
					object: -> "(#{finas})[#{argos}]"
				}[typeof fina]?() ? "#{finas} + #{argos}"
		capsuladas: (argos)-> (fina)->
			salida = g.capsula fina
			for argo of argos
				salida += g.capsula argos[argo]
			salida
			# g.tetas g.claudias argos
		capsuladora: (argos)->
			if argos.length
				"#{g.capsula argos.pop()}#{g.capsuladora argos}"
			else
				""
			# salida = ""
			# for argo of argos
			# 	salida = "#{salida}#{g.capsula[argos[argo]]}"
			# salida
		afinadora: (argos)-> (fina) ->
			"#{g.capsula(fina)}#{
				(for argo of argos
					g.capsula(argos[argo]) # "#{g.tetas(fina)}"
				).join("")}"
		ali: (argos)->
			salida = true
			for argo in argos
				salida = salida and (argo ? neutro)
			salida
		hai: (argos)->
			neutro = false
			salida = neutro
			for argo in argos
				salida = salida or (argo ? neutro)
			salida
		sigma: (argos)->
			neutro = 0
			salida = neutro
			for argo in argos
				salida = salida + (argo ? 0)
			salida
		pan: pan = (argos)->
			if argos.length
				argos.shift()() and pan argos
			else
				true
		ces: ces = (argos)->
			if argos.length
				argos.shift()() or ces argos
			else
				false
		chi: chi = (jeto)->(tren)->
			if tren.length
				jeto[tren[0]] ? chi(jeto)(tren.slice(1))
			# 
			# if tren.length
			# 	jeto[tren[0] ? ] ? quién(jeto)(tren.slice(1))