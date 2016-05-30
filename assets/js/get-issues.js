	function getSessions(){
		
		var sessionsHTML = "<ul>";
		
		$.get("https://api.github.com/repos/nceas/open-science-codefest/issues?labels=proposed%20session", function(data){
			
			var numSess = data.length,
				session;
			
			for(var i=0; i<numSess; i++){
				session = data[i];
				sessionsHTML += "<li class='posts-title'><a href='" + session.html_url + "'>" + session.title + "</a>";
				
				var labels = session.labels.length;
				for(var x=0; x<labels; x++){
					sessionsHTML += "<span class='label label-info' style='background-color:#" + session.labels[x].color + "'><a href='https://github.com/NCEAS/open-science-codefest/labels/" + session.labels[x].name + "'>" + session.labels[x].name + "</a></span>";
				}
				
				sessionsHTML += "</li>";
			}
			
			sessionsHTML += "</ul>";
						
			$('#github-sessions').html(sessionsHTML);
		});
	

	}
	
	
	
