
function loadJSONResource(path) {

	if (directory_exists(path)) {
		var jsonFiles = [];
		var fileName = file_find_first(path + "/*.json", fa_none);
	
		while (fileName != "") {
			array_push(jsonFiles, fileName);
			fileName = file_find_next();
		}
	
		file_find_close();
		return jsonFiles;
	}

	return -1;

}