running
killProcess: aPid
	"15 - SIGTERM"

	self primitiveKill: aPid asInteger signal: 15