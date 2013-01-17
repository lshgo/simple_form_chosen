// function chosen_loads(select_name){
// 	var selectObj = $("select."+select_name);
// 	selectObj.chosen({no_results_text: "没有匹配结果"}).keyup(function(){
// 		alert("asdfasdf")
// 	})
// }


function chosen_load(select_name){
	var selectObj = $("select."+select_name);               //选择框对像
	selectObj.removeAttr("multiple")                        //删掉多选
	selectObj.chosen({no_results_text: "没有匹配结果"});     //更新chosen对像
	var chznObj = $("#"+selectObj.attr("id")+"_chzn")       //chosen对像时会产生div元素
	var textObj = chznObj.find("input[type=text]") //$("#"+selectObj.attr("id")+"_chzn_search")  //输入文体框对像
	textObj.attr("name","user[asdfasdfs]")
	textObj.unbind()      //这里是删chosen默认的的事件
	var returnobj = []    //返回对像
	textObj.bind("blur", function(){    //输入框失去焦点事bind
		if(returnobj.length < 1){
			if(textObj.val().length > 0){ 
			}
		} 
	})
	textObj.bind("keyup", function(event){       //输入框输入件事
		if($("."+selectObj.attr("id")+"button_add").length <= 0){
			chznObj.find("ul").parent().append("<div class='"+selectObj.attr("id")+"button_add' style='padding-right:20px;'><p align='right'>没有匹配结果&nbsp;。&nbsp;&nbsp;<input class='button push-right' name='commit' type='submit' value='增加'></p></div>")
			$("."+selectObj.attr("id")+"button_add").bind("click",function(){
				alert(textObj.val())
			})
		}
		var val = event.target.value             //输入value
		if(val.length > 0){
 		$.getJSON(selectObj.attr("url"), {   //到服务端获取
                val: val
                }, function(products){
                	var strHtml = "";
                	var buttonObj = $("."+selectObj.attr("id")+"button_add") //增加button
                	if(products.length > 0){
	                	for(var i=0; i<products.length ; i++){
	                		strHtml += "<option value='"+products[i]._id+"'>"+products[i].age+"</option>"
	                	}
	                	buttonObj.hide() //如果有结果，隐
					}else{
						strHtml += "<option value=''></option>"
						buttonObj.show() //如果没有结果，显示
					} 
					selectObj.html(strHtml)              //从新更新select控件内容
					selectObj.trigger("liszt:updated")   //chosen触发更新select控件内容
					textObj.val(val)                     //输入框会被清空，这里是从新付值
					returnobj = products				 
                }
        );
    }
	})
} 

