/// @desc Chalk initialization.

CHALK.init();

// CHALK.__log("test FUCK FUCK FUCK {}", ["fuck"], LOG.TRACE);

CHALK.log.trace("test FUCK FUCK FUCK {}", "fuck");

var test = CHALK.createContainer();

CHALK.log.trace(CHALK.root.__content);
CHALK.root.addChild(test);

//CHALK.root.addChild();

//var agh = new __chalk_UIElement();
//agh.destroy();

//var test = new __chalk_Log("tha message {}", ["test"], LOG.TRACE);
//test.printDebug();