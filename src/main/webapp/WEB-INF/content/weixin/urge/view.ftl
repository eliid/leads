<!DOCTYPE html>
<html lang="en">
<head>
<#include "/pub/header_wx.ftl"/>
<title>李先生</title>
<style type="text/css">
body, html {
	height: 100%;
	-webkit-tap-highlight-color: transparent;
	background-color: #FBF9FE;
}
.weui_label{width: 4em;}
</style>
</head>
<body ontouchstart>
	<div class="weui_tab">
		<div class="weui_navbar">
			<div id="tab1" class="weui_navbar_item weui_bar_item_on">客户信息</div>
			<div id="tab2" class="weui_navbar_item">追踪记录</div>
		</div>
		<div class="weui_tab_bd">
			<div id="tab1_item">
				<div class="weui_cells" style="margin-top: 1px;">
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>客户姓名</p>
						</div>
						<div class="weui_cell_ft">李先生</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>客户电话</p>
						</div>
						<div class="weui_cell_ft">15812345678</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>线索来源</p>
						</div>
						<div class="weui_cell_ft">今日头条</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>业务大类</p>
						</div>
						<div class="weui_cell_ft">投诉建议</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>业务小类</p>
						</div>
						<div class="weui_cell_ft">车务</div>
					</div>
					<div class="weui_cell">
						<div class="weui_cell_bd weui_cell_primary">
							<p>是否加急</p>
						</div>
						<div class="weui_cell_ft">是</div>
					</div>
				</div>
				<div class="weui_cells_title">咨询详情</div>
				<div class="weui_cells weui_cells_form">
		            <div class="weui_cell">
		                <div class="weui_cell_bd weui_cell_primary">
		                    <textarea class="weui_textarea" style="color: #888;font-size: 14px;" readonly="readonly" rows="2">客户咨询详情客户咨询详情客户咨询详情客户咨询详情</textarea>
		                </div>
		            </div>
		        </div>
			</div>
			<div id="tab2_item" style="display: none;">
		        <div class="weui_panel weui_panel_access" style="margin-top: 1px;">
		            <div class="weui_panel_bd">
		                <div class="weui_media_box weui_media_text">
		                    <h5 class="weui_media_title">杨健  2016-02-25 : 14:43:38</h5>
		                    <p class="weui_media_desc">丹甫股份sfgfhb fgfg</p>
		                </div>
		                <div class="weui_media_box weui_media_text">
		                    <h5 class="weui_media_title">杨健  2016-01-25 : 15:05:59</h5>
		                    <p class="weui_media_desc">由各种物质组成的巨型球状天体，叫做星球。星球有一定的形状，有自己的运行轨道。</p>
		                </div>
		            </div>
	        	</div>
			</div>
		</div>
	</div>
	</div>
	<#include "/pub/footer_wx.ftl"/>
	<script type="text/javascript">
		Zepto(function($) {
			Zepto(".weui_navbar_item").on("click", function() {
				Zepto(".weui_navbar_item").removeClass("weui_bar_item_on");
				Zepto(this).addClass("weui_bar_item_on");
				Zepto(".weui_tab_bd").children().hide();
				var tid = Zepto(this).attr("id");
				Zepto("#" + tid + "_item").show();
			});
		})
	</script>
</body>
</html>