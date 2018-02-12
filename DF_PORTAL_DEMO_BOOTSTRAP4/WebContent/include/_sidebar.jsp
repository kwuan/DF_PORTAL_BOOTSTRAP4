<script language="JavaScript">
<!--
function goView(blogId) {
	var form = getForm();
	form.elements['id'].value = blogId;
	doCmd('goView');
}
function goVote(blogId) {
	var form = getForm();
	form.elements['id'].value = blogId;
	doCmd('voteBlog');
}
function doSubCatList(ind) {
	var form = getForm();
	doList('subCategory', form.elements['subCats['+ind+'].value'].value);
}
function doTagsList(ind) {
	var form = getForm();
	doList('tags', form.elements['tags['+ind+'].value'].value);
}
function doList(key, value) {
	var form = getForm();
	if(form.elements['searchCondition.position'] != null)
		form.elements['searchCondition.position'].value = 0;
	form.elements['searchCondition.'+key].value = value;
	doCmd('list');
}
// -->
</script>

<nested:hidden property="searchCondition.yearMonth" value=""/>
<nested:hidden property="searchCondition.createdBy" value=""/>
<nested:hidden property="searchCondition.category" value=""/>
<nested:hidden property="searchCondition.subCategory" value=""/>
<nested:hidden property="searchCondition.tags" value=""/>
<div id="bsider" class="blog-sidebar">
		

				<nested:present property="blogSummary">
				<nested:notEmpty property="blogSummary.memberList"><div class="member">
				<nested:size id="memberCount" property="blogSummary.memberList" />
					<h1><img src="<%= ctxPath %>/images/ic_members.png" />สมาชิก (<%= memberCount %>)</h1>
					<ul>
						<nested:iterate property="blogSummary.memberList1"><li>
							<a href="javascript:doList('createdBy', '<nested:write property="value" />')">
							<p><nested:write property="label" /></p></a>
						</li></nested:iterate>
					</ul>
					<nested:notEmpty property="blogSummary.memberList2">
					<table border="0" width="100%"><tr><td align="right">
						<a id="imembers" href="#members">แสดงทั้งหมด</a>&nbsp;&nbsp;</td></tr></table>
				<div style="display:none"><div id="members">
					<ul class="membersUl">
						<nested:iterate property="blogSummary.memberList"><li class="membersLi"><a href="javascript:doList('createdBy', '<nested:write property="value" />')">
							<p><nested:write property="label" /></p></a>
						</li></nested:iterate>
					</ul>
				</div></div>
					</nested:notEmpty>
				</div><!--end members--></nested:notEmpty>
				<nested:notEmpty property="blogSummary.lastPostList"><div class="recent">
					<h1><img src="<%= ctxPath %>/images/ic_cate.png" />โพสต์ล่าสุด</h1>
					<ul>
					<nested:iterate property="blogSummary.lastPostList"><li>
						<a href="javascript:goView('<nested:write property="value" />')"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				</div><!--end recent--></nested:notEmpty>
				<nested:notEmpty property="blogSummary.categoryList"><div class="categories">
					<h1><img src="<%= ctxPath %>/images/ic_cate.png" />หมวด</h1>
					<ul>
					<nested:iterate property="blogSummary.categoryList"><li>
						<a href="javascript:doList('category', '<nested:write property="value" />')"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				</div><!--end categories--></nested:notEmpty>
				<nested:notEmpty property="blogSummary.subCategoryList"><div class="categories">
				<nested:iterate id="subCats" property="blogSummary.subCategoryList">
				<nested:hidden name="subCats" property="value" indexed="true" /></nested:iterate>
					<h1><img src="<%= ctxPath %>/images/ic_cate.png" />หมวดหมู่ย่อย</h1>
					<ul>
					<nested:iterate property="blogSummary.subCategoryList" indexId="ind"><li>
						<a href="javascript:doSubCatList(<%= ind %>)"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				</div><!--end categories--></nested:notEmpty>
				<nested:notEmpty property="blogSummary.yearMonthList"><div class="archives">
					<h1><img src="<%= ctxPath %>/images/ic_cate.png" />คลังเก็บ</h1>
					<ul>
					<nested:iterate property="blogSummary.yearMonthList"><li>
						<a href="javascript:doList('yearMonth', '<nested:write property="value" />')"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				</div><!--end archives--></nested:notEmpty>
				<nested:notEmpty property="blogSummary.tagsList"><div class="tags">
<nested:iterate id="tags" property="blogSummary.tagsList">
	<nested:hidden name="tags" property="value" indexed="true" /></nested:iterate>
				<nested:size id="tagsCount" property="blogSummary.tagsList" />
					<h1><img src="<%= ctxPath %>/images/ic_tags_big.png" />แท็ก (<%= tagsCount %>)</h1>
					<ul>
						<nested:iterate property="blogSummary.tagsList1" indexId="ind"><li>
						<a href="javascript:doTagsList(<%= ind %>)"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				<nested:notEmpty property="blogSummary.tagsList2">
					<table border="0" width="100%" id="tagsAll"><tr><td align="right">
						<a id="itags" href="#allTags">แสดงทั้งหมด</a>&nbsp;&nbsp;</td></tr></table>
				<div style="display:none"><div id="allTags">
					<ul class="tagsUl">
						<nested:iterate property="blogSummary.tagsList" indexId="ind"><li class="tagsLi">
						<a href="javascript:doTagsList(<%= ind %>)"><nested:write property="label" /></a></li></nested:iterate>
					</ul>
				</div></div>
				</nested:notEmpty>
				</div><!--end tags--></nested:notEmpty>
				</nested:present>
</div>				