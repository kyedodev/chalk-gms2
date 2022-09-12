// trans rights, black lives matter
// kye cedar :3c

#macro CHALK	(__chalk_get_static_instance())
#macro CHALK_ID	(__chalk_get_static_instance().genID())

function __chalk_get_static_instance()
{

static inst = undefined;

ifndef inst { inst = {
//
//
//
//
//

__initialized: false,

logs: [],
root: undefined,


init: function()
{
	__initialized = true;
	root = new __chalk_UIElement();
},


#region Loop Functions

	update: function()
	{
		root.update();
	},


	draw: function()
	{
		root.draw();
	},

#endregion Loop Functions


/// @param string       The letters that will be prepended to the generated ID.
genID: function(_prefix = "U")
{
	static _id = 0;
	return _prefix + string_replace_all(string_format(++_id, 10, 0), " ", "0");
},


createContainer: function(_parent = undefined)
{
	return new __chalk_UIElement(UI_CONTAINER, _parent);
},


#region Logging

	__log: function(_message, _inserts = undefined, _priority = LOG.TRACE)
	{
		var log = new __chalk_Log(_message, _inserts, _priority);
		array_push(logs, log);
		log.printDebug();
	},

	log:
	{
	
		debug: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.DEBUG); },
	
		trace: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.TRACE); },
	
		success: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.SUCCESS); },
	
		warning: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.WARNING); },
	
		error: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.ERROR); },
	
		fatal: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.FATAL); },
	
		input: function(_message, _inserts = undefined)
		{ CHALK.__log(_message, _inserts, LOG.INPUT); },
	
	},

#endregion Logging

//
//
//
//
//
}; } // ifndef inst

// Returning the static instance variable.
return inst;

}