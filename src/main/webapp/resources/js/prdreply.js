console.log("prdreply Module.............");


var prdreplyService = (function() {


	function add(prdreply, callback, error) {

		console.log("add prdreply...........");

		$.ajax({

			type : 'post',
			url : '/repliesprdQnA/new',
			data : JSON.stringify(prdreply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {

				if (callback) {
					
					callback(result);
					
					
					
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		}) // ajax

	}
	
	
	function replyadd(prdreply, callback, error) {

		console.log("add prdreplyreplyadd...........");

		$.ajax({

			type : 'post',
			url : '/repliesprdQnA/replynew',
			data : JSON.stringify(prdreply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {

				if (callback) {
					
					callback(result);
					
					
					
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		}) // ajax

	}
	
	
	function getList(param, callback, error){
		
		console.log(JSON.stringify(param));
		
		
		var itemCode = param.itemCode;
		
		
		
		var page = param.page || 1;
		
		console.log(itemCode);
		
		console.log(page);
		
		$.getJSON("/repliesprdQnA/pages/"+itemCode+"/"+page+".json",
		function(data){
			if(callback){
				callback(data.prdReplyCnt, data.list);
				
			}	
		}).fail(function(xhr,status, err){
			if(error){
				error();
			}
		});
		
	
			
		
		
	}
	
	function remove(itemCode, callback, error){
		
		$.ajax({
			
			type : 'delete',
			url : '/repliesprdQnA/' + itemCode,
			success : function(deleteResult, status, xhr){
				
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
		
	}
	
	function update(prdreply, callback, error){
		
     console.log("바prdreply보" + prdreply);

	
		$.ajax({
			type : 'put',
			url : '/repliesprdQnA/' + prdreply.replyNo,
			data : JSON.stringify(prdreply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
				if(callback){
				callback(result);
			}
		},
		error : function(xhr, status, er){
			if(error){
				error(er);
			}
		}
		});
	}
	  
	function get(itemCode, callback, error){
	
		
		$.get("/repliesprdQnA/" + itemCode + ".json", function(result){
			
		  if(callback){
			  callback(result);
		  }
		
		}).fail(function(xhr, status, err){
		
			if(error){
				error();
			}
		});
		
		
	}
	

	function displayTime(timeValue){
			
	        var today = new Date();
	        
	        var gap = today.getTime() - timeValue;
	        var dateObj = new Date(timeValue);
	        
	        var str = "";
	        
	        if (gap < (1000 * 60 * 60 * 24)){
	            
	            var hh = dateObj.getHours();
	            var mi = dateObj.getMonth() + 1 ;//getMonth() is zero-based
	            var ss = dateObj.getDate();

	            return[(hh > 9? '' : '0')+ hh, ':',(mi > 9 ? '': '0') + mi, ':',(ss > 9 ? '':'0') + ss].join('');
	        }else {

	                var yy = dateObj.getFullYear();
	                var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
	                var dd = dateObj.getDate();

	                return [yy, '/', (mm > 9? '':'0') + mm, '/', (dd > 9 ? '' : '0') + dd].join('');

	        }
	};
	

	
	return {
		
	
		add : add,
		replyadd : replyadd,
		
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	}

	
})();