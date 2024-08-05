fx_version "cerulean"
game "gta5"

lua54 'yes'

shared_script "shared/**/*"
client_script "client/**/*"
server_script "server/**/*"

ui_page 'web/build/index.html'

files {
	'web/build/index.html',
	'web/build/**/*',
}