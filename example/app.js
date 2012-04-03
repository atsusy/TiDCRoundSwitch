// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.
var TiDcRoundSwitch = require('jp.msmc.tidcroundswitch');

var window = Ti.UI.createWindow({
	backgroundColor:'white'
});

var roundSwitch = TiDcRoundSwitch.createSwitch({
	width:100,
	height:24,
	onText:'On',
	offText:'Off',
	onTintColor:'brown',
	value:true
});
window.add(roundSwitch);

var flexSpace = Titanium.UI.createButton({
        systemButton:Titanium.UI.iPhone.SystemButton.FLEXIBLE_SPACE
});

var toolBarSwitch = TiDcRoundSwitch.createSwitch({
	width:50,
	height:18,
	onText:'',
	offText:''
});

var toolBar = Ti.UI.createToolbar({
	items:[flexSpace, toolBarSwitch],
	bottom:0
});

window.add(toolBar);



roundSwitch.addEventListener('changed', function(e){
	alert(e.value);
});



window.open();

