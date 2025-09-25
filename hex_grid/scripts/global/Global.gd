class_name Global

func logerr(caller: String, msg: String):
	logerr(caller, msg, [])

func logerr(caller: String, msg: String, values: Array):
	values.push_front(msg)
	values.push_front(caller)
	var format: String = "[%s] %s"

	var formatted: String = format % [caller, msg]

	printerr(formatted % values)
