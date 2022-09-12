// trans rights, black lives matter
// kye cedar :3c

#macro UI_CONTAINER	("ui_container")
#macro UI_LABEL		("ui_label")
#macro UI_BUTTON	("ui_button")
#macro UI_INPUT		("ui_input")

#macro isuielem	(\
					(type == UI_CONTAINER) ||\
					(type == UI_LABEL) ||\
					(type == UI_BUTTON) ||\
					(type == UI_INPUT)\
				)

function __chalk_UIElement(_element_type = UI_CONTAINER, _parent = undefined) constructor
{
	__parent	= undefined;
	__type		= _element_type;
	__position	= undefined;
	__alignment	= ALIGN_TOP_LEFT;
	__children	= [];
	__unique_id	= CHALK_ID;
	
	// If type is not a UI element type, then it defaults to UI_CONTAINER.
	var type = __type;
	if !isuielem __type = UI_CONTAINER;
	
	// Content contents lmao.
	__content	= {
		text: "",
	};
	
	
	
	__flushed = false;
	
	
	
	addChild(_parent);
	
	
	
	/// @param UIElement	Element to add as a child.
	/// @returns bool		If the child element was successfully added.
	static addChild = function(_child) {
		if(!is_struct(_child)) return;
		var type = _child.__type;
		if !isuielem return false; // Return if not UI element.
		
		_child.__parent = self;
		array_push(__children, _child);
		return true;
	};
	
	static update = function()
	{
		// Update children of element.
		var i = 0;
		repeat(i < array_length(__children)) __children[i].update();
		
		// TODO : Update position on window resize.
		// TODO : Animation.
	};
	
	
	static draw = function()
	{
		// Draw children of element.
		var i = 0;
		repeat(i < array_length(__children)) __children[i].draw();
	};
	
	
	static destroy = function()
	{
		// Calling every child's destroy function, which will call their children's destroy functions.
		var i = 0;
		repeat(i < array_length(__children)) __children[i].destroy();
		
		// De-referencing the children.
		__children = [];
	};
}