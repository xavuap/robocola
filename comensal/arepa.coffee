
	module.exports = (html)-> (v)->
		html()( [
			# html()()
			html(
				# "": null
				"!DOCTYPE":null
				html: null
			)()
			html(
				html: null
				lang: v.toki ? null
			) [
				# "hola"
				html(
					head: null
				)	[
						# "hola"
						html(
							meta: null
							charset: "utf-8"
							name: "viewport"
							content: "user-scalable=no"
						) null
						html(
							title: null
						) v.nimi
						v.icono? html
						# <link rel="icon" type="image/png" href="http://example.com/image.png" />
					].concat(
						for hoja in v.css ? []
							html(
								link: null
								type: "text/css"
								href: hoja
								rel: "stylesheet"
							) null
					).concat(
						for script in v.ecma ? []
							html(
								script: null
								type: "text/javascript"
								charset: "utf-8"
								"#{
									if script.src?
										"src"
									else
										""
								}": script.src
							) script.content ? "" 
					)
					# .concat(
					# 	for script in coffee
					# 		html(
					# 			script: null
					# 			type: "text/coffeescript"
					# 			"#{
					# 				if script.src?
					# 					"src"
					# 				else
					# 					""
					# 			}": script.src
					# 		) script.content ? "" 
					# )
				#	(script = (src)->
				#		html(
				#			script: null
				#			type: "text/javascript"
				#			src: src
				#		) []
				#	)("vendor/jquery")
				#	# script "vendor/jquery/ui"
				#	script "vendor/spin/js"
				#	script "vendor/jquery/hash"
				#	script "comensal"
				#	# script "comensal/moldes"
				#]
				# html(
				# 	body: null
				# ) ""
			]
			# html()()
		])()