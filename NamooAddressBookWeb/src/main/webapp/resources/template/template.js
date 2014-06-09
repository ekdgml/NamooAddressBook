/**
 * 
 */
var nsjs = nsjs || {};
nsjs.makeHtml = function(templateUrl, object, callback) {
	//
	$.get(templateUrl, function(templateHtml) {
		//
		var html = '';
		if (Array.isArray(object)) {
			for (var i = 0, length = object.length; i < length; i++) {
				//
				html += nsjs.makeObjectToHtml(templateHtml, object[i]);
			}
		} else {
			html = nsjs.makeObjectToHtml(templateHtml, object);
		}
		callback(html);
	});
};

nsjs.makeObjectToHtml = function(templateHtml, obj) {
	//
	var attrBlocks = templateHtml.match(/\{\w+\}/gi);
	for (var j = 0; j < attrBlocks.length; j++) {
		var attrBlock = attrBlocks[j];
		var attrName = attrBlock.replace(/[\{|\}]/gi, "");
		templateHtml = templateHtml.replace(attrBlock, obj[attrName] || "");
	}
	return templateHtml;
};