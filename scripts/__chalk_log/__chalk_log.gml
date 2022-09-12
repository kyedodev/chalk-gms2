// trans rights, black lives matter
// kye cedar :3c

enum LOG
{
	DEBUG,
	TRACE,
	SUCCESS,
	WARNING,
	ERROR,
	FATAL,
	INPUT
};

#macro LOG_PRIORITY_TEXT global.__chalk_log_priority_text

global.__chalk_log_priority_text = ["DEBUG", "TRACE", "SUCCESS", "WARNING", "ERROR", "FATAL", "INPUT"];

///
///
/// @param string       Message to log, replaces all "{}"s with according value in the next parameter.
/// @param [array]      Array of variables to insert into message. Defaults to undefined.
/// @param [LOG]        Priority of log, which dictates when and where it's displayed. Defaults to TRACE.
function __chalk_Log(_message, _inserts = undefined, _priority = LOG.TRACE) constructor
{
	__timestamp = current_time;
	__message   = string(_message);
	__inserts   = _inserts;
	__priority  = _priority;
	
	
	if(__inserts == undefined) __inserts = [];
	if(!is_array(__inserts))   __inserts = [__inserts];
	
	
	static printDebug = function()
	{
		var out  = formatted();
		var prio = LOG_PRIORITY_TEXT[__priority];
		ifndef prio
			prio = LOG_PRIORITY_TEXT[LOG.TRACE];
		
		show_debug_message(prio + "\t" + out);
	};
	
	
	static formatted = function()
	{
		var out = __message;
		var ins = __inserts;
		
		var i = 0;
		repeat(i < array_length(ins))
		{
			out = string_replace(out, "{}", string(ins[i]));
			i++;
		}
		
		return out;
	};
}