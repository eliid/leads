<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "/pub/header_res.ftl"/>
		 <link href="${contextPath}/res/pub/css/plugins/iCheck/custom.css" rel="stylesheet">
		 <link href="${contextPath}/res/pub/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
		 <link href="${contextPath}/res/pub/css/demo.css" rel="stylesheet">
		 
		 <title>客户线索</title>
	</head>
	<body class="gray-bg">
	<form action="${contextPath}/leads/client/saveClient.do" method="post" name="form1" id="form1" class="form-horizontal">
		<div class="container-fluid">
		 <div class="panel panel-default" style="margin-top: 1px;">
		       <div class="panel-heading">客户线索</div>
		       <div class="panel-body" style="padding-bottom: 0px;">
		       <div class="col-sm-12">
		            <div class="float-e-margins">
		                 <div class="ibox-content" style="padding:0 0 0 0">
		                 
		                 <div class="form-group ">
                                <label class="col-sm-2 control-label">客户姓名 <font color="#ff0000">*</font></label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="clientName" id="clientName" datatype="*" maxlength="10" nullmsg="请输入客户姓名" value="${clientVO.clientName!''}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label  required" >手机<font color="#ff0000">*</font></label>
                                <div class="col-sm-4">
                                    <input type="text" name="tel" id="tel" onblur="codeCheckTel(this)" datatype="m" errormsg="请正确输入手机号" maxlength="11" value="${clientVO.tel!''}" class="form-control" >
                                    <input	name="telPre" id="telPre" type="hidden" value="${clientVO.tel!''}"/>
                                </div>
                            </div>
                            
                             <div class="form-group ">
                                <label class="col-sm-2 control-label  required">来源  <font color="#ff0000">*</font></label>
                                 <div class="col-sm-2">
                                    <@select type='0' codeType="1044" defValue="${clientVO.fromtypeBig}" fieldId="fromtypeBig" fieldName="fromtypeBig" props=" datatype='*' nullmsg='请选择线索来源' class='form-control' " />
                                </div>
                                <div class="col-sm-2">
                                    <select style='display:none;'  class='form-control fromtype'"></select>
                                    <div class="fromtype">
                                    <div id="magicsuggest_1022"></div>
                                	<input type="hidden" id="fromtype" name="fromtype" value="${clientVO.fromtype}" class="form-control">
                                	</div>
                                    <input id="channel" name="channel" value="${clientVO.channel}" placeholder="请填写" style='display:none;' class='form-control fromtype'/>
                                    <@select type='1' codeType="1046" defValue="${clientVO.fromtype}" fieldId="fromtype" fieldName="fromtype" paramName="pid" paramValue="0" props=" style='display:none;' class='form-control fromtype'" />
                                </div>
                                <label class="col-sm-2 control-label">手机1</label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="tel1" id="tel1" maxlength="11"  value="${clientVO.tel1!''}" datatype="mOe" onblur="codeCheckTel(this)" class="form-control">
                                </div>                                
                            </div>
                            <div class="form-group ">
                                <label class="col-sm-2 control-label">QQ</label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="qq" id="qq" maxlength="20" value="${clientVO.qq!''}" class="form-control">
                                </div>
                                <label class="col-sm-2 control-label  required" >微信</label>
                                <div class="col-sm-4">
                                    <input type="text" name="weixin" id="weixin"  maxlength="20" value="${clientVO.weixin!''}" class="form-control" >
                                </div>
                            </div>
                            <div class="form-group ">                                
                                <label class="col-sm-2 control-label  required" >座机电话</label>
                                <div class="col-sm-4">
                                    <input type="text" name="phone" id="phone" placeholder="0731-48458745 或 85623658"  maxlength="13" value="${clientVO.phone!''}" class="form-control" >
                                </div>
                                <label class="col-sm-2 control-label">身份证号</label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="personid" id="personid" maxlength="18" value="${clientVO.personid!''}" class="form-control">
                                </div>
                            </div>
                            <div class="form-group ">
                                
                                <label class="col-sm-2 control-label  required">加急处理</label>
                                <div class="col-sm-4">
                                   <input name="ifurgent" value="1" <#if clientVO.ifurgent = '1'> checked </#if>  type="radio"> 是   <input name="ifurgent" value="0" <#if clientVO.ifurgent = '0'> checked </#if> type="radio"> 否
                                </div>
                                <label class="col-sm-2 control-label  required">小定金支付情况</label>
                                <div class="col-sm-4">
                                <input type="hidden" value="${clientVO.depositStatus!''}" />
                                   <@select type='0' codeType="1040" defValue="${clientVO.depositStatus!''}" fieldId="depositStatus" fieldName="depositStatus" props="datatype='*' nullmsg='请选择定金支付情况' class='form-control' " />
                                </div>
                            </div>
                            
                            <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="email" id="email" maxlength="50"  value="${clientVO.email!''}" class="form-control">
                                </div>
                            <label class="col-sm-2 control-label">外部订单号</label>
                                <div class="col-sm-4 ">
                                    <input type="text" name="orderNo" id="orderNo" maxlength="50"  value="${clientVO.orderNo!''}" class="form-control">
                                </div>
                            </div>
                            
                            <div class="form-group">
                            <label class="col-sm-2 control-label">是否已结算</label>
                                <div class="col-sm-4 ">
                                   <@select type='0' codeType="1000" defValue="${clientVO.isCharged!''}" fieldId="isCharged" fieldName="isCharged" props="class='form-control' " />

                                </div>
                            </div>
                            
		                 
		                 </div>
		            </div>
		       </div>
		       </div>
		 </div>
		 
		 
		  <div class="panel panel-default" style="margin-top: 1px;">
	       <div class="panel-heading">咨询信息</div>
	       <div class="panel-body" style="padding-bottom: 0px;">
	       <div class="col-sm-12">
	            <div class="float-e-margins">
	                 <div class="ibox-content" style="padding:0 0 0 0">
	                 
	                 <div class="form-group">
                                <label class="col-sm-2 control-label">业务大类  <font color="#ff0000">*</font></label>
                                <div class="col-sm-4">
                                    <@select type='1' codeType="1021" defValue="${clientVO.bigPid!'-1'}" fieldId="bigPid" fieldName="bigPid"  paramName="pid" paramValue="0" props="datatype='*' nullmsg='请选择业务大类' class='form-control' " />
                                </div>
                                <label class="col-sm-2 control-label">业务小类  <font color="#ff0000">*</font></label>
                                   <div class="col-sm-4" id="samllPidDiv" data-defvalue="${clientVO.smallPid!-1}">
		    			  			<@select type='1' codeType="1021" defValue="${clientVO.samllPid!'-1'}" fieldId="samllPid" fieldName="samllPid"  paramName="pid" paramValue="111" props="datatype='*' nullmsg='请选择业务小类' class='form-control' " />
                                   </div>   
                            </div>
                            
                            <div class="form-group">
                                <label class="col-sm-2 control-label">咨询详情  <font color="#ff0000">*</font></label>
                                <div class="col-sm-10">
                                    <textarea placeholder="请录入咨询详情" class='form-control' name="title" datatype="*" nullmsg="请录入咨询详情" id="title">${clientVO.title!''}</textarea>
                                </div>
                                
                            </div>

	                 </div>
	            </div>
	       </div>
	       </div>
		 </div>
		 
		 
		  <div class="panel panel-default" style="margin-top: 1px;">
		       <div class="panel-heading">任务指派</div>
		       <div class="panel-body" style="padding-bottom: 0px;">
		       <div class="col-sm-12">
		            <div class="float-e-margins">
		                 <div class="ibox-content" style="padding:0 0 0 0">
		                 
                             <div class="form-group">
                                <label class="col-sm-2 control-label">客户经理</label>
                                <div class="col-sm-1"><input type="text" id= "filName"  size="6" onblur="setOpen();" placeholder="定位公司" class="form-control"></div> 
                                <div class="col-sm-3">
                                   <input id="sidName" name ="sidName" type="text" value="${dealPerson!''}" datatype="*" nullmsg="请选择客户经理" class='form-control' readonly  placeholder="请选择客户经理"  onclick="showMenu();" />
                                   <input id="sid" name ="sid" type="hidden"  value="${clientVO.sid!''}" />                                
                                   <input id="companyid" name ="companyid" type="hidden"  value="${clientVO.companyid!''}"  />
                                   
                                   <input id="sidNameFromye" name ="sidNameFromye" type="hidden"  value="${sidNameFromye!''}" />       
                                    <input id="sidFromye" name ="sidFromye" type="hidden"  value="${sidFromye!''}" />                                
                                   <input id="companyidFromye" name ="companyidFromye" type="hidden"  value="${companyidFromye!''}"  />
                                   </div>                                
                            </div>
                            <input id="isnew" name="isnew" type="hidden" value="${isnew!''}">
                            <input id="id" name="id" type="hidden" value="${clientVO.id!''}">
                            
                            <div class="form-group">
	                            <div class="col-sm-4 col-sm-offset-8">
	                                   <input type="button" value="关 闭"  onclick="closeTab();" class="btn btn-sm btn-primary zd-btn-pd1" >                                  
	                                   &nbsp; &nbsp; 
	                                   <input type="submit" value="提 交" class="btn btn-sm btn-primary zd-btn-pd1"  data-toggle="modal" data-target="#myModal">
	                             </div>
                            </div>
		                 
		                 </div>
		            </div>
		       </div>
		       </div>
		 </div>
		<div>
		<div id="menuContent" class="menuContent" style="display:none;  position: absolute;">
		<ul id="treeDemo" class="ztree" style="margin-top:0; width:340px; height: 300px;"></ul>
		</div>
	</form>
	<#include "/pub/message.ftl"/>
	<#include "/pub/footer_res_detail.ftl"/>
	<script src="${contextPath}/res/pub/js/jquery.ztree.core-3.5.js" type="text/javascript"></script>
    <script src="${contextPath}/res/pub/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script>
	<script type="text/javascript">
	var myData_1022=<@queryselect type="1" codeType="1022" />
 //读取下拉框的 值，健 
 		function getmagicSuggest_1022(){
 			ms1 = $('#magicsuggest_1022').magicSuggest({
 		        width: '80%',//宽度
 		        placeholder: '请选择',
 		        style:'float:left;width:100%;',
 		        allowFreeEntries: false,   //这个参数很重要，如果你不需要用户自已创建标签，则用这个
 		        data: myData_1022.data,
 		        selectionStacked: true ,
 		        maxSelectionRenderer: function(data){ return ""},
 		        noSuggestionText: '',
 		        maxSelection:1 //单选按照 0取值
 		        
 		    });
 		    $(ms1).on('selectionchange', function(e, cb, s){
 		     var object =cb.getSelection()[0];  
 		    console.log(object);
 		    if(undefined==object){$("#fromtype").val("");}else{
 		     $("#fromtype").val(object.id);}
 		    });
 		    getStoredCallback_1022(ms1);
 		}
 		//获取查询条件回显
 	function getStoredCallback_1022(ms1){ 
 	  var bl = $('#fromtype').val();
 	  if(bl == ''||0==bl) return;
 	  var array = bl.split(","); 
 	  //设置延迟，否则取不到数据
 	  setTimeout(function (){
     	  ms1.setValue(array);
     	  }, 200);
 	}
 	
	jQuery(document).ready(function() {
		getmagicSuggest_1022();
		$("#form1").Validform({tiptype : 1,
		ignoreHidden : false,
		dragonfly : false,
		tipSweep : false,
		showAllError : true,
		postonce : true,
		ajaxPost : false,
		datatype:{mOe:/^$|^13[0-9]{9}$|14[0-9]{9}|15[0-9]{9}$|18[0-9]{9}$|17[0-9]{9}$/},
		beforeSubmit:function(cur){
			if($('#fromtypeBig').val() == '1' && $('input[id="fromtype"]').val()=='0'){
				layer.alert("请选择来源！");
				return false;
			}else{
			    return true;
			}
		}
		});
	});
		
		$("#fromtypeBig option").each(function(i,o){
					if($(this).prop("selected")){
						$(".fromtype").hide();
						if(i!=0){
							$(".fromtype").eq(i).removeAttr("disabled");
							$(".fromtype").eq(i).show();
						}
					}else{
						$(".fromtype").eq(i).attr("disabled",true);
					}
				});
		
		$("#fromtypeBig").on("change",function(){
				$("#fromtypeBig option").each(function(i,o){
					if($(this).prop("selected")){
						$(".fromtype").hide();
						if(i!=0){
							if(i==1){
								$(".fromtype").eq(i).removeAttr("disabled");
								$(".fromtype").eq(i).find("#fromtype").removeAttr("disabled");
								$(".fromtype").eq(i).find("#fromtype").attr("datatype","*").attr("nullmsg","请选择线索类型");
							}else{
								$(".fromtype").eq(i).attr("datatype","*").attr("nullmsg","请选择线索类型");
								$(".fromtype").eq(i).removeAttr("disabled");
							}
							
							$(".fromtype").eq(i).show();
						}
					}else{
						if(i==1){
							$(".fromtype").eq(i).find("#fromtype").attr("disabled",true);
							$(".fromtype").eq(i).find("#fromtype").removeAttr("datatype").removeAttr("nullmsg");
						}else{
							$(".fromtype").eq(i).removeAttr("datatype").removeAttr("nullmsg");
							$(".fromtype").eq(i).attr("disabled",true);
						}
						
					}
				});
			});
		

		
		jQuery("#bigPid").on("change", function(){
			jQuery.ajax({
				type:"post",
				url:"${contextPath}/leads/client/querySub.do?bigPid="+jQuery("#bigPid").val(),
				data:"",
				async:true,
				dataType:"text",
				success:function(data){			
					var $samllPidDiv=jQuery("#samllPidDiv");
					var v=$samllPidDiv.attr("data-defvalue");
					if(v=='-1' || v=='0'){
						v='';
					}
					$samllPidDiv.empty().html(data).find("select").attr("datatype","*").addClass("form-control").val(v);
					$samllPidDiv.attr("data-defvalue","");	
				}
			});	
		});
		
		function filter(node) {
			if(jQuery("#filName").val()=="")
				return false;
		    return node.name.indexOf(jQuery("#filName").val())>-1;
		}
		function setOpen(){
			var zTree = jQuery.fn.zTree.getZTreeObj("treeDemo");
			zTree.expandAll(false);
			
			//总公司一层全部打开。
			var nodes = zTree.getNodes();
			//nodes[0].children
			zTree.expandNode(nodes[0], true, false, true);
			
			
			//var node = zTree.getNodeByParam("name", "北京分公司", null);alert(node);
			var node = zTree.getNodesByFilter(filter, true); // 仅查找一个节点
			zTree.expandNode(node, true, true, true);
			showMenu();
		}
			var setting = {
				check: {
					enable: true,
					chkStyle: "radio",
					radioType: "all"
				},
				view: {
					dblClickExpand: false
				},
				data: {
					simpleData: {
						enable: true
					}
				},
				callback: {
					onClick: onClick,
					onCheck: onCheck
				}
			};
			
			jQuery(function() {
				var zNodes;
				jQuery.ajax({
					type : "post",
					url : "${contextPath}/leads/client/queryOrgPerson.do?from=forAssign",
					data : "",
					async:true,
					dataType : "text",
					success : function(data) {
						zNodes = eval(data);
						jQuery.fn.zTree.init(jQuery("#treeDemo"), setting, zNodes);
						//初始化 业务小类 bigPid
						if(jQuery("#bigPid").val().length>0){
							jQuery("#bigPid").trigger('change');
						}
					}
				});
				
				var message="${message!''}";
				if(message.length>0){
					jQuery('#messageModal').modal('show');
				}
				jQuery('#messageModal').on('hidden.bs.modal', function (e) {
					if(message.length>1){
						closeTab();
					}
				})
				
				var isnew = jQuery("#isnew").val();
				if(isnew=="1"){
					jQuery("#sidName").val(jQuery("#sidNameFromye").val());
					jQuery("#sid").val(jQuery("#sidFromye").val());
					jQuery("#companyid").val(jQuery("#companyidFromye").val());
				}
				//给默认的radio赋值
				var vasl=jQuery('input:radio[name="ifurgent"]:checked').val();
				
				if(vasl==null)
					jQuery("input[name=ifurgent][value=0]").attr("checked",'checked');
			});
			
			function onClick(e, treeId, treeNode) {
				var zTree = jQuery.fn.zTree.getZTreeObj("treeDemo");
				zTree.checkNode(treeNode, !treeNode.checked, null, true);
				return false;
			}

			function onCheck(e, treeId, treeNode) {
				var zTree = jQuery.fn.zTree.getZTreeObj("treeDemo"),
				nodes = zTree.getCheckedNodes(true),
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].name + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				jQuery("#sidName").val(v);
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					//把AA去掉
					v += nodes[i].id.substring(2,nodes[i].id.length) + ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				jQuery("#sid").val(v);
	
				v = "";
				for (var i=0, l=nodes.length; i<l; i++) {
					v += nodes[i].pId+ ",";
				}
				if (v.length > 0 ) v = v.substring(0, v.length-1);
				jQuery("#companyid").val(v);
			}

			function showMenu() {
				var isnew = jQuery("#isnew").val();
				if(isnew=="1"){
					return;
				}
				var cityObj = jQuery("#sidName");
				var cityOffset = jQuery("#sidName").offset();
				jQuery("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
				
				jQuery("body").bind("mousedown", onBodyDown);
			}
			function hideMenu() {
				jQuery("#menuContent").fadeOut("fast");
				jQuery("body").unbind("mousedown", onBodyDown);
			}
			function onBodyDown(event) {
				if (!(event.target.id == "sidName" || event.target.id == "menuContent" || jQuery(event.target).parents("#menuContent").length>0)) {
					hideMenu();
				}
			}
			
			function codeCheckTel(obj) {
				//是修改的时候，值是原来的值不需要验证。
				if($("#tel").val() != "" && $("#tel").val() ==  $("#telPre").val())
					return;
				// 首先进行校验		
				$.ajax({
					type:"post",
					url:"${contextPath}/leads/client/checkTel.do",
					data:"tel="+ $("#tel").val(),
					dataType:"text",
					success:function(data){//alert(data);
						if(data.length > 0){
							var message=data;
							if(message.length>0){$("#tel").attr("value",'');
								$("p").html(message);
								jQuery('#messageModal').modal('show');
								$("#tel").val('');
								
							}
						}
					}
				});	
			}
	</script>

	</body>
</html>