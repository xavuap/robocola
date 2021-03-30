
	Date.prototype.getWeek = ->
		target = new Date(this.valueOf())
		dayNr = (this.getDay() + 6) % 7
		target.setDate(target.getDate() - dayNr + 3)
		firstThursday = target.valueOf()
		target.setMonth(0, 1)
		if target.getDay() isnt  4
			target.setMonth(0, 1 + ((4 - target.getDay()) + 7) % 7)
		1 + Math.ceil((firstThursday - target) / 604800000)
	module.exports = (fina)-> fina (sente) -> sente ( (fina)-> fina
		j: (j)-> (fina)-> {j...,fina(j)...}
		claudia: (argos...)-> (fina)-> fina argos...
		r: (fina)-> 
			((rr)-> rr rr) (rr)-> (abc...)-> fina(rr rr) abc... 
		stitch: (argo)-> (jeto)-> jeto[argo]
		nimi: (nimi)-> (tetas)-> "#{nimi}": tetas
		mostra: (tetas)->
			console.log tetas
			tetas
		has: (teta)-> (tipa)->
			teta.split(tipa).length > 1
		jefa: (jeto)-> (fina)-> 
			for cada of jeto
				fina[cada] = jeto[cada]
			fina
	) (g)-> g.j( g.j(g) (g)->
		quanta: (efe)-> 
			g.r (questa) -> (a,bc...)->
				efe a, (n)->
					if bc.length 
						try
							questa bc...
						catch 
							n
					else n
		#g.r (questa)-> (abc...)->
		#quanta: (efe)->
		#	(n)->
		#		if bc.length
		#			try 
		#				questa bc...
		#			catch
		#				n
		#		else n
		tetas: g.r (tetas)-> (jeto)-> 
			switch typeof jeto
				when "string" then "\"#{jeto}\""
				when "function" then jeto.toString()
				when "object"
					if jeto?
						if Array.isArray jeto
							"[]".split("").join (tetas sign for sign in jeto).join(",")
						else
							"{}".split("").join (
								for sign of jeto
									[sign, tetas jeto[sign]].join ": "
							).join(",")
					else jeto
				else jeto
		viste: g.r (viste)-> (jeto)->(braccia)->
			# g.m viste: jeto
			for braccio of braccia
				if jeto[braccio]?
					viste(jeto[braccio]) braccia[braccio]
				else
					jeto[braccio] = braccia
			jeto
		enfilar: g.r (enfilar)-> (arreglo)-> # [prima,seconda,terza] -> prima: seconda: terza 	# prima:seconda:terza
			if arreglo.length > 1
				"#{arreglo.shift()}": enfilar(arreglo)
			else
				arreglo.shift()
		## mezclar: g.quanta (a,f)-> {a...,f({})...}
		# merge: (jj...)-> # arreglo de objetos > objeto
		# 	g.r(jj,{}) (a,j,r)->
		# 		if a[0]?
		# 			r a[1..], {j...,a[0]...}, r
		# 		else
		# 			j
		consultar: g.r (consultar)-> (arreglo)-> # [prima,seconda,terza] -> prima[seconda][terza] # prima.seconda.terza
			((arre)->
				if arreglo.length
					consultar(arreglo)[arre]
				else
					arre
			)(arreglo.pop())
		caminos: g.r (camila)-> (campo) -> g.claudia([]) (salida)-> # {prima: seconda: terza: quarta} -> [[prima,seconda,terza,quarta]]# arreglo bidimensional con todos los caminos
			# salida = []
			for champ of campo
				if typeof campo[champ] is "object"
					for moi in camila(campo[champ])
						salida.push [champ].concat(moi)
				else
					salida.push [champ,campo[champ]]
			salida
		# dotNotation: (campos)-> g.claudia({}) (salida)->  # {prima: seconda: terza: quarta} -> {"prima.seconda.terza": quarta}
		# 	# salida = {}	21:27: 06
		# 	for cada in g.caminos(campos)
		# 		cola = cada.pop()
		# 		salida[cada.join(".")] = cola
		# 	salida
		compa: (patria)->(alien)-> # nazi, residente, terrícola, conservador # visitante, extranjero extraterrestre, heterogéneo #
			for ala of alien
				if typeof alien[ala] is "object" and patria[ala]?
					compa(patria[ala])(alien[ala])
				else
					if patria?[ala] is alien[ala]
						delete patria[ala]			# borra de patria los comunes con alien
		pera: (tempo)-> (fina)->
			setTimeout(
				-> fina tempo
				tempo
			)
	) (g)-> g.j( g.j(g) (g)->
		sigma: g.quanta (a,f)-> a + f(0)
	) (g)->
		tempo: (local) -> g.claudia(
			if local.tempo?
				new Date(local.tempo)
			else
				new Date
		) (tempo)-> g.claudia(
			switch typeof local
				when "number"
					hora: local
				when "string"
					hora: local*1
				when "object"
					local
				when undefined
					hora: 0
		) (local)-> 
			for tempa of local
				switch tempa
					when "hora"
						tempo.setUTCHours(tempo.getUTCHours() + local[tempa])
					when "feira"
						tempo.setUTCDate(tempo.getUTCDate() + local.feira)
					# when "daily"
					# 	tempo.setUTCDay()
			(fina)-> fina
				tempo: tempo
				daily: tempo.getUTCDay()
				raw: tempo.getTime()
				horas: tempo.getUTCHours()
				reloj: tempo.getUTCHours()*100+tempo.getUTCMinutes()
				semana: tempo.getWeek()
				anuario: g.sigma(
					tempo.getUTCFullYear()*10**6
					tempo.getWeek()*10**4
					tempo.getUTCDay()*1000
					tempo.getUTCHours()*10
					Math.floor(tempo.getUTCMinutes()/12)
				)
				semanario: g.sigma(
						tempo.getUTCDay()*10**4
						tempo.getUTCHours()*100
						tempo.getUTCMinutes()
					)
				minuti: tempo.getUTCMinutes()
				mes: g.stitch(tempo.getUTCMonth()) [
					"enero"
					"febrero"
					"marzo"
					"abril"
					"mayo"
					"junio"
					"agosto"
					"septiembre"
					"octubre"
					"noviembre"
					"diciembre"
				]
				feira: g.stitch(tempo.getUTCDay()) g.claudia(
					"domingo"
					"lunes"
					"martes"
					"miércoles"
					"jueves"
					"viernes"
					"sábado"
				) (feira...) -> feira
		chak: (jeto)-> (efe)->
			g.claudia(Object.entries(jeto)...) g.quanta (a,f)-> {
				(g.nimi(a[0]) efe a[1])...
				f({})...
			}
		cada: (tren)-> (fina)->
			g.claudia(tren) g.r (cada)-> (tren,sale...)->
				if tren.length
					cada tren[1..], sale..., (fina tren[0])
				else
					sale
		capsulas: (tetas...)-> (fina)->
			g.claudia(fina,tetas...) g.quanta (a,f)-> [
				"()".split("").join g.tetas a
				f("")
			].join ""
		capsula: g.quanta (a,f)-> [
				"()".split("").join g.tetas a
				f("")
			].join ""

		# marsupia()(ki)(g.c()) ()-> siempre
		marsupia: -> g.claudia({}) (claudia)-> (argo)-> (juana)->(fina)->
			g.claudia() g.stitch(claudia[argo]?)
				true: -> g.claudia(claudia[argo]) fina
				false: -> juana (tetas) ->
					g.claudia(claudia[argo] = tetas) fina
		# cumulo: (fina) -> (claudia)-> (quanta)-> #
		# 		unless quanta?
		# 			claudia
		# 		else
		# 			claudia = fina(claudia,quanta)
		dotNotation: (campos)-> g.claudia({}) (salida)-> # {prima: seconda: terza: quarta} -> {"prima.seconda.terza": quarta}
			# salida = {}	
			for cada in g.caminos(campos)
				cola = cada.pop()
				salida[cada.join(".")] = cola
			salida
		camila: (fina) -> (camila)-> (quanta)-> #
				unless quanta?
					camila
				else
					camila = fina(camila,quanta)
			# unless claudia?
			# 	claudia = quanta
			# else
			# 	
		montos: (claudia)-> g.claudia(claudia) (claudia)-> (ki)->
			unless claudia[ki]? then claudia[ki] = {}
			(adornos) -> # g.mostra claudia
				for adorno of adornos
					unless claudia[ki][adorno]?
						claudia[ki][adorno] = adornos[adorno]
					else
						claudia[ki][adorno] += adornos[adorno]
				# claudia[ki] += adornos
				claudia[ki]
		# juana: (argos...)-> g.claudia(on) (booleana)-> (juana)-> # juana de argos
		# 	if booleana
		# 		booleana = no 
		# 		juana argos...
		# 		return true
		# 	else
		# 		return false
		# juana: (argos...)-> g.claudia(on,null) (booleana,valeria)-> (juana)-> # juana de argos
		# 	if booleana
		# 		booleana = no
		# 		valeria = juana argos...
		# 	valeria
		valeria: (claudia)-> (valeria)-> # asignación
			unless valeria?
				claudia
			else
				claudia = valeria
		valeria: (claudia)->(fina)->
			g.claudia(
				(meme)-> (valeria)->
					unless valeria?
						claudia
					else
						meme valeria
			) fina
		valeria: # (valeria)->
			g.r (meme)-> (claudia)->
				
		ki: -> g.claudia({}) (claudia)->(ki)-> (valeria)->
			unless claudia[ki]?
				claudia[ki] = valeria
			claudia[ki]
		# ki: -> g.c() (claudia)-> (valeria)->
		# 	unless claudia?
		# 		claudia = valeria
		# 	valeria
		# juana: ->
		# 	unless claudia?
		# 		claudia = valeria			
		juana: (argos...)-> g.claudia() (valeria)-> (juana)-> # juana de argos
			unless valeria?
				valeria = juana argos...
			valeria
		# juanas g.n(t.par) (par) ->
		# 	algo par
		# [t.par]
		# juanas()(ki) (ki)-> soltantuna
		juanas: -> g.claudia({}) (claudia) -> (ki)-> 
			(fina)->
				unless claudia[ki]?
					claudia[ki] = fina ki
				claudia[ki]
		# juanas: (argos...)-> g.claudia(on) (booleana)-> ({juana,siempre})-> # juana de argos
		# 	if booleana
		# 		booleana = no
		# 		juana argos...
		# 	else
		# 		siempre argos
		mt: (tetas)->
			g.mostra g.tetas tetas
		tm: (tetas)->
			g.tetas g.mostra tetas
		mn: (nimi)->(tetas)->
			g.mostra g.nimi(nimi) tetas
		t: g.tetas
		c: g.claudia
		m: g.mostra
		n: g.nimi
		s: g.stitch
		q: g.quanta
		v: g.viste
		suerte: (gente...)->
			gente[Math.floor Math.random()*gente.length]
		presta: (tempo)-> (finas)-> g.r(
				setTimeout(
					finas.no
					tempo
				)
			) (d)->
				await finas.fa()
				g.m "presta"
				clearTimeout d
		cronica: (tempo)-> (fina)-> g.claudia() g.r (refina)-> ->
			if await fina()
				setTimeout(
					refina
					tempo
				)
		# perales: (tempo)->(argos...)-> # (finas...)->
		# 	g.quanta (a,f)->
		# 		a(argos...)
		# 		g.pera(tempo) ->
		# 			f ->
		perales: (tempo)-> # (argos...)-> # (finas...)->
			g.quanta (a,f)->
				a tempo #(argos...)
				g.pera(tempo) ->
					f ->
		inter: (tetas)-> (tipa)-> (fina) ->
			fina tetas.split tipa
			.join(tipa)

		pan: (argos...)->
			g.quanta (a,f)-> 
				a(argos...) and f(on)
		may: (argos...)->
			g.quanta (a,f)-> 
				a(argos...) or f(no)
		mezclar: g.quanta (a,f)-> {a...,f({})...}
		xuan: (argos...)->
			g.quanta (a,f)->
				a?(argos...) ? f ->
		conta: (tempo)->(fina)->
			# g.conta(5) true: ->, false: ->
			g.c(tempo--) g.stitch(tempo > 0) fina
			###
			if tempo-- < 0
				fina()
			else
				g.mostra conta: tempo
			###
		camino: (pala,monte)->(desde)->(hasta)->
			# g.mostra {desde,hasta}
			(hasta/desde - 1)*monte*pala
		# diferencio: (desde)-> (hasta)->
		# 	()
		debug: (booleana)->(fina)->(tetas)->
			if booleana
				g.mostra tetas
				fina tetas
			tetas
		erro: (fina)->(ñelda)->
			console.error ñelda
			fina ñelda
			throw  ñelda
		tonal: ({erro,claudia,url,jeto,debug})->
			# require una claudia, un tren, un jeto
			# puede usar un debug
			g.r(claudia,url,jeto,false) (claudia,cola,jeto,booleana,funziona)->
				debug claudia
				for s of jeto
					if s is cola[..s.length-1]
						g.r(cola[s.length..]) g.s(typeof jeto[s])
							function: (coda)->
								debug function: coda
								try
									debug? "entrego valor"
									jeto[s] {
										cola: (puede...)->(fina)->
											g.r("hola") g.s(coda in puede)
												true: fina
												false: erro
										marsupia: g.marsupia(claudia)(s)
										erro: erro
										coda: coda
										celo: (celos...)-> (fina)->
											for celo in celos
												if celo is coda[..celo.length-1]
													fina coda[celo.length..]
													hay = on
											unless hay?
												erro "#{celos.join(",")}"

									}
								catch e
									debug e
									erro(e)
							object: (coda)->
								claudia[s] = {} unless claudia[s]?
								funziona claudia[s], coda, jeto[s], false, funziona
							undefined: ->
								debug? "erro"
								erro("tipo indefinido")
						booleana = true
						break
				erro("non trovo #{url}") unless booleana
		html: (atr)->(content)->(tablas="")->
			###
				content
					undefined
						«!DOCTYPE html»
					null
						«link rel="icon" /»
					""
						«span»«/span»
					[]
						«div»
						«/div»
					"hola"
						«span»"hola"«/span»
					["lista",html(ul:null)]
						«li»
							lista
							«ul»
						«/li»
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
				'\xa0' unless props.length
				"<#{props.join(' ')}#{ (" /" if content is null) ? "" }>#{ {string:content+cierre}[typeof content] ? "" }" if props.length
				( (("\t" if props.length) ? "\t" ) + tablas + (conteudo?(tablas+"\t") ? "\t"+conteudo) for conteudo in content).join("\n") if content? and content.length and typeof content isnt "string"
				tablas+cierre if props.length and Array.isArray(content)
				'\xa0' unless props.length
			].filter(Boolean).join("\n")