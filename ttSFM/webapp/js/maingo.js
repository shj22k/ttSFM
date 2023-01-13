
	$(document).ready(function(){
		$("#maingo").on("click", function(){
			$("#maindata").attr({
				"action":"maingo.sfm",
			    "method":"POST",
			    'enctype':'application/x-www-form-urlencoded'
			}).submit();
		});
	});
