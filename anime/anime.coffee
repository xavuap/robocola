
	module.exports = (g)-> (sheila)-> 
		chorro: (url)->(pro)->
			sheila.spawn("anime/youtube-dl",["-o", "-", url]).stdout.pipe(pro)
		o: (url)->
			sheila.spawn("anime/youtube-dl",["-o", "-", url]).stdout
		e: (url)->
			sheila.spawn("anime/youtube-dl",["-q","-o", "-", url]).stdout
		s: (url)->
			sheila.spawn("anime/youtube-dl",["-q","-o", "-", url])
		q: (url)-> ({erro,fina})-> g.c(
			spawn: sheila.spawn("anime/youtube-dl",["-q","-o", "-", url])
		) ({spawn})->
			g.m "saludos"
			spawn.stderr.on "data", erro
			spawn.stdout.on "data", fina
		g: (url)-> g.c(
			spawn: sheila.spawn("anime/youtube-dl",["-g", url])
		) ({spawn})-> ({erro,fina,sale})-> 
			# g.m "uri"
			spawn.stderr.on "data", erro ? ->
			spawn.on "close", sale ? ->
			spawn.stdout.on "data", (uri)->
				# g.m {uri}
				# g.c( uri.split "\n" ) fina
				# g.c( uri ) fina
				fina decodeURIComponent "#{uri}"

		pwd: ->
			sheila.execFile "pwd", (e,o,r)->
				g.m o
		json: (url)-> ({erro,bien,fina})-> # pro
			# g.mostra json: url: url
			sheila.execFile(
				"anime/youtube-dl"
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