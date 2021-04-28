
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
			g.r (questa)-> (a,bc...,cc)->
				unless +bc
					questa bc..., efe a, cc
				else
					efe a, cc
		quanta: (efe)->
			g.r (questa)-> (a,bc...,cc)->
				if a?
					questa bc..., efe a, cc
				else cc
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
		valeria: (jeto)-> (fina)-> (llave)-> (argos...)->
			jeto[llave] ? jeto[llave] = fina argos...
		valeria: (jeto)-> (llave)-> (argos...)-> (fina)-> 
			# argo fina llave jeto
			# better
			# jeto llave argos... fina # for curryfication
			# g.mostra jeto: Object.keys(jeto)
			# g.mostra fina: fina.toString()
			# g.mostra {argos,llave}
			unless j