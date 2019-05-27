//ÅÅÐò×Ö¶Î
function sort(id) { 
	var sortAsc = true; 
	var field=$$("orderBy").value;
	if (field!=null && field.indexOf(id)==0 && field.indexOf("asc")>0){ 
		sortAsc = false; 
	}
	$$("orderBy").value=id+" "+(sortAsc?"asc":"desc");
	$$("doSearch").click();
} 
