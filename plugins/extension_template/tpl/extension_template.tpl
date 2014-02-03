<!-- BEGIN: MAIN -->
<!-- BEGIN: NOJQUERY -->
<div id="module_settings" class="accordion in collapse" style="height: auto;">
	<div class="accordion-group block">
		<div class="accordion-heading">
			<h3 class="<!-- IF {PHP.et_thememode} == 1 -->nomargins<!-- ELSE --><!-- ENDIF -->">
				{PHP.L.plu_title}
			</h3>
		</div>
		<div class="accordion-body collapse in" id="main_settings">
			<div class="accordion-inner margin_theme{PHP.et_thememode}">{PHP.L.mplug_nojquery}</div>
			<!-- /.accordion-inner -->
		</div>
		<!-- /.section1 -->
	</div>
	<!-- /.accordion-group -->
</div>
<!-- END: NOJQUERY -->
<!-- BEGIN: JQUERY -->
<script type="text/javascript">
String.prototype.arg = function() {
    var i = -1, args = arguments;
    return this.replace(/#\{(.*?)\}/g, function(one, two) {
        return (typeof args[0] == 'object')?args[0][two]:args[++i];
    });
};

$(document).ready( function() {

	/* 	Bootstrap style accordion animation code */
	$('.accordion .accordion-inner').hide();
	$('.accordion .accordion-heading a.accordion-toggle').addClass('collapsed');
	$('.accordion .accordion-body.in .accordion-inner').show()
		.parents('.accordion-group').find('.accordion-heading a.accordion-toggle').removeClass('collapsed');

	$('.accordion .accordion-heading a.accordion-toggle').click(function(e) {
		e.stopPropagation();

		var $this = $(this),
			id = $this.attr('href'),
			dataToggle = $this.data('toggle'),
			dataParent = $this.data('parent');

		if (dataParent && $(dataParent).size()) {
			$parent = $(dataParent);
		} else {
			$parent = $this.parents('.accordion');
		}
		$current = $parent.find(id);
		collapsible_class = dataToggle ? dataToggle : 'collapse';

		if ($current.hasClass('in')) {
			$current.find('.accordion-inner').slideUp(250);
			$current.removeClass('in');
			$this.addClass('collapsed');
		} else {
			$parent.find('.'+collapsible_class).removeClass('in').find('.accordion-inner').slideUp(250);
			$parent.find('.accordion-heading a.accordion-toggle').addClass('collapsed');
			$current.addClass('in').find('.accordion-inner').slideDown(250).parents('.accordion').find('.accordion-heading a.accordion-toggle').removeClass('collapsed');
		}
		return false;
	});
	/* end of Bootstrap style accordion animation code */

	// enable togglers
	$('.toggler').change(function(){
		var $input = $(this),
			id = $input.attr('id');
		if (id) {
			if ($input.prop('checked')) {
				$('.'+id).show(100);
			} else {
				$('.'+id).hide(100);
			}
		}
	});

	$('.pid_1,.pid_3,.pid_4').hide();

	var valold=$('#pni').val().replace(/[^a-z0-9_]/ig,'');;
	// track extension filename change
	$('#pni').keyup(function(){
		var val = this.value.replace(/[^a-z0-9_]/ig,'');
		if (val !== valold) {
			valold = val;
			this.value = val;
			$('.ttl').text(val);
			$('#id_1,#id_4').val(val);
			$('#id_3').val(val+'_');
		}
	}).change(function(){
 		if (this.value.replace(/[^a-z0-9_]/ig,'') == '') {
 			val = 'pluginname';
			this.value = val;
			$('.ttl').text(val);
			$('#id_1,#id_4').val(val);
			$('#id_3').val(val+'_');
		}
 	});

	$('div.panes').show(200);

	// adds addition input field with remove link
	$('a.add_file_input').click(function(e) {
		e.stopPropagation();
		var new_idx = $('div[id^="dyn"]').length + 1;
		var pni = $('#pni').val();
		$('#cf').append(
			'<div id="dyn'+new_idx+'"><label class="inline" for="addon_'+new_idx+'"><input id="addon_'+new_idx+'" class="add" type="checkbox" name="plug['+new_idx+'][used]" value="1" />&nbsp;&nbsp;<span class="ttl">'
			+ pni
			+ '</span></label>.<input name="plug['+new_idx+'][name]" type="text" value="header" /><a class="del_file_input" id="dellink_'+new_idx+'" href="#"'
			 +'>({PHP.L.Delete})</a></div>');
		$('#dellink_'+new_idx).click(function(e) {
			e.stopPropagation();
			$('#dyn'+new_idx).remove();
			return false;
		});
		return false;
	});

	$('input[name=plugtyp]').change(function() {
		var options = {},
			$input = $(this);
		$("div.panes").slideUp(500, function() {
 			ajaxSend({
				url : '{PHP.ajax_link}' + '&mode=' + $input.val(),
				method : 'POST',
				data : 'x={PHP.sys.xk}',
				divId : 'tpl_prm'
			});
				if ($('#rt_2').attr('checked')) {
				$('#pdirs').val('inc,img,lib,js,tpl');
			} else {
				$('#pdirs').val('inc,img,js,tpl');
			}
			$('input[name=plugtyp]').each(function() {
				var $this = $(this);
				$target_div = $('div[id^=' + $this.val() + ']');
				if ($this.attr('checked')) {
					$target_div.show();
				} else {
					$target_div.hide();
				}
			});
		});
			$("div.panes").slideDown(500);
	});
});
</script>

<form id="frm1" class="ajax post-make_results" name="frm1" action="{PHP|cot_url('admin','m=other&p=extension_template&a=step2')}" method="post" style="margin-top:35px;">
<div id="make_results"></div>
<div class="typeselect">
	<p><b>{PHP.L.mplug_select}:</b></p>
	<!-- BEGIN: INPUT_TYP -->
	<input id="rt_{in.id}" type="radio" name="plugtyp" value="{in.typ}"{in.check}><label class="inline" for="rt_{in.id}"> {in.desc}</label><br/>
	<!-- END: INPUT_TYP -->
</div>

<div class="etabs">
	<div class="panes" style="display: none;">
		<div id="module_settings" class="accordion" style="height: auto;">
			<div class="accordion-group block">
				<div class="accordion-heading">
					<h3 class="<!-- IF {PHP.et_thememode} == 1 -->nomargins<!-- ELSE --><!-- ENDIF -->">
						<a href="#main_settings" data-parent="#module_settings" data-toggle="collapse" class="accordion-toggle">{PHP.L.mplug_stage1}</a>
					</h3>
				</div>
				<div class="accordion-body collapse in" id="main_settings">
					<div class="accordion-inner">
						{MAIN_CFG}
					</div>
					<!-- /.accordion-inner -->
				</div>
				<!-- /.section1 -->
			</div>
			<!-- /.accordion-group -->
			<div class="accordion-group block">
				<div class="accordion-heading">
					<h3 class="<!-- IF {PHP.et_thememode} == 1 -->nomargins<!-- ELSE --><!-- ENDIF -->">
						<a href="#misc_param" data-parent="#module_settings" data-toggle="collapse" class="accordion-toggle">{PHP.L.mplug_stage2}</a>
					</h3>
				</div>
				<div class="accordion-body collapse" id="misc_param">
					<div class="accordion-inner margin_theme{PHP.et_thememode}">
						<h4>{PHP.L.mplug_params}:</h4>
						<div id="tpl_prm">
							{PRM}
						</div>
					</div>
					<!-- /.accordion-inner -->
				</div>
				<!-- /.section2 -->
			</div>
			<!-- /.accordion-group -->
		</div>
	</div>
</div>

<p class="valid"><input class="submit<!-- IF {PHP.et_thememode} == 2 --> inner-margins<!-- ELSE --><!-- ENDIF -->" type="submit" name="n" value="{PHP.L.mplug_goto2}" /></p>

</form>

<!-- END: JQUERY -->
<!-- END: MAIN -->

<!-- BEGIN: MAIN_CFG -->
<div id="options">
    <div id="nameopt"><strong>{PHP.L.mplug_name}</strong><br />
        <input id="pni" name="plf[name]" type="text" value="plug_filename" onkeyup="" />
		{PHP.L.mplug_name2}
		<br /><br />
		<div id="SIENA_cat">{PHP.L.mplug_category}: {PHP.ext_cat_selector}</div>
	</div>
	<div id="mainopt">
    	<div class="chk">
	    	<input class="toggler" id="makedirs" checked="checked" type="checkbox" name="plf[makedirs]" value="1" />
	    	<label class="" for="makedirs">
	    		<strong>{PHP.L.mplug_folders}</strong>
    		</label>
    		(inc, img, js, lib, tpl, classes)
    		<br />
    		<div class="makedirs">
    			<span id="spdirs" class="mrg"><input id="pdirs" name="plf[dirsname]" type="text" value="inc,img,js,lib,tpl" /> {PHP.L.mplug_subfolders}</span>
    		</div>
    	</div>
    	<div class="chk">
	    	<label class="" for="">
	    		<input id="makelang"  class="toggler" checked="checked" type="checkbox" name="plf[lang]" value="1" />
    			<strong>{PHP.L.mplug_lang}</strong>
			</label>
    		<br />
    		<div class="makelang">
    			<span id="splang" class="mrg"><input id="plang" name="plf[langlist]" type="text" value="ru,en" /> {PHP.L.mplug_langdesc}</span>
    			<br />
    			<span class="ttl mrg">plug_filename</span>.*.lang.php
    		</div>
    	</div>
  		<!--    <span class="ttl mrg">plug_filename</span>.en.lang.php<br />
    	<span class="ttl mrg">plug_filename</span>.ru.lang.php</div> -->
    	<div class="chk">
	    	<label class="" for="">
	    		<input checked="checked" type="checkbox" name="plf[main]" value="1" />
    			<strong>{PHP.L.mplug_main}</strong>
    		</label>
    		<br />
    		<span class="ttl mrg">plug_filename</span>.php
    	</div>
		<div id="sed_setup" class="chk">
    		<label class="" for="">
    			<input checked="checked" type="checkbox" name="plf[setup]" value="1" />
    			<strong>{PHP.L.mplug_setup}</strong>
    		</label>
    		<br />
    		<span class="ttl mrg">plug_filename</span>.setup.php
    	</div>
    	<br/>
    	<div id="SIENA_setup" class="chk" style="display:block;">
        	<label><input class="add" type="checkbox" name="plf[siena][configure.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.configure.sql</label><br/>
        	<label><input class="add" type="checkbox" name="plf[siena][configure.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.configure.php</label><br/>
        	<label><input class="add" type="checkbox" name="plf[siena][install.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.install.sql</label><br/>
        	<label><input class="add" type="checkbox" name="plf[siena][install.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.install.php</label><br/>
        	<label><input class="add" type="checkbox" name="plf[siena][uninstall.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.uninstall.sql</label><br/>
        	<label><input class="add" type="checkbox" name="plf[siena][uninstall.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.uninstall.php</label><br/>
    	</div>
	</div>
	<div id="addon">
    	<strong>{PHP.L.mplug_addon}</strong> (ajax, header, tools, rc, ...):
    	<a class="add_file_input" href="#" >({PHP.L.Add})</a>
    	<br />
    	<label class="inline" for="addon_0">
    		<input id="addon_0" class="add" type="checkbox" name="plug[0][used]" value="1" />
    		<span id="plug_ttl" class="ttl">plug_filename</span>
    	</label>
    	.<input name="plug[0][name]" type="text" value="header" />
		<div id="cf"></div>
	</div>
	<div id="SIENA_res"  style="display:block;" class="chk">
    	<strong>{PHP.L.mplug_common}</strong> (functions, resource):
    	<br/>
    	<label>
    		<input class="add" type="checkbox" name="plf[siena][functions.php]" value="1" />
    		inc/<span id="plug_ttl" class="ttl">plug_filename</span>.functions.php
    	</label>
    	<br/>
    	<label>
    		<input class="add" type="checkbox" name="plf[siena][resources.php]" value="1" />
    		inc/<span id="plug_ttl" class="ttl">plug_filename</span>.resources.php
    	</label>
    	<br/>
	</div>
	<div id="SIENA_md"  style="display:block;" class="chk">
    	<strong>{PHP.L.mplug_mdfiles}</strong>
    	<br/>
    	<label>
    		<input checked="checked" class="add" type="checkbox" name="plf[misc][readme.md]" value="1" />
    		README.md - {PHP.L.mplug_mddesc}
    	</label>
    	<br/>
    	<label>
    		<input class="add" type="checkbox" name="plf[misc][versions.md]" value="1" />
    		versions.md - {PHP.L.mplug_mdvers}
    	</label>
    	<br/>
	</div>
</div>
<!-- END: MAIN_CFG -->
-----------------------------------------------
<!-- BEGIN: LOG -->
<div id="results_block" class="<!-- IF {PHP.et_thememode} == 1 -->inner-margins<!-- ELSE --><!-- ENDIF -->" style="height: auto;">
		<div class="block">
			<h3 class="<!-- IF {PHP.et_thememode} == 1 -->nomargins<!-- ELSE --><!-- ENDIF -->">
				{PHP.L.mplug_creating}
			</h3>
					<div class="<!-- IF {PHP.et_thememode} == 2 -->inner-margins<!-- ELSE --><!-- ENDIF -->">
					<ul class="log">
<!-- BEGIN: LINE -->
						<li class="line">{logline}</li>
<!-- END: LINE -->
					</ul>
<!-- BEGIN: ERROR -->
					<div class="error">{err_msg}</div>
<!-- END: ERROR -->
					<br />
					<!-- IF {PHP.cfg.turnajax} -->
					<a href="#" onClick="$('#results_block').remove(); return false;">{PHP.L.Close}</a>
					<!-- ELSE -->
					<a href="{PHP.scriptname}">{PHP.L.mplug_back}</a>
					<!-- ENDIF -->
					</div>
		</div>
</div>
<!-- END: LOG -->
-----------------------------------------------
<!-- BEGIN: PRM -->
<!-- BEGIN: INPUT_PRM -->
<div class="pid_{in.num}">
<input id="id_{in.num}" name="prm_{in.num}" type="text" size="40" value="{in.val}">
<label class="inline" for="id_{in.num}">&nbsp;{in.text}</label>
</div>
<!-- END: INPUT_PRM -->
<!-- END: PRM -->
-----------------------------------------------

<!-- BEGIN: TPL_MODES -->
GENOA >> Cotonti Genoa version (0.6.xx)
SIENA >> Cotonti Siena version (0.9.xx)
<!-- END: TPL_MODES -->
-----------------------------------------------
<!-- BEGIN: TPL_MARKS_GENOA -->
MMP_PLUGNAME >> {PHP.pfname}
MMP_PLUGDATE >> {PHP|date("Y-M-d")}
MMP_VARPREFIX >> {PHP.pfname}_
MMP_PLUGFILE >> {PHP.pfname}
MMP_HOOK >> standalone
MMP_PLUGTITLE >> Plugin title
MMP_PLUGDESC >> Plugin Description
MMP_PLUGPART >>
MMP_TAGS >> example.tpl:{EXAMPLE_TAG}
MMP_COPYRIGHT >> Copyright (c) 2011-{PHP|date("Y")}
MMP_AUTHOR_NAME >> {PHP.cfg.plugin.extension_template.author}
MMP_MISCINFO >>  - If your enjoy my plugin please consider donating to help support future developments<br />[url]mailto:{PHP.cfg.plugin.extension_template.email}[/url]<br />Thanks
MMP_LICENSE >> Distributed under {PHP.cfg.plugin.extension_template.licence} License.
MMP_PLUGLANG >> en
MMP_PLUGPATH >> plugins
MMP_VERSION >> {PHP.cfg.plugin.extension_template.version}
MMP_LANGDESC >>
MMP_PLBEGIN >> [BEGIN_SED]
MMP_PLEND >> [END_SED]
MMP_VAR.NAME >>test
MMP_VAR.VALUE >> TEST
MMP_PBEGIN >> [BEGIN_SED_EXTPLUGIN]
MMP_PEND >> [END_SED_EXTPLUGIN]
MMP_PLUGORDER >> 10
MMP_SEDMARK >> SED_
MMP_CODEMARK >> SED_CODE
MMP_DIEMARK >> Wrong URL
MMP_NOTES >>
MMP_SQL >>
MMP_AUTHG >> R1
MMP_LOCKG >> W2345A
MMP_AUTHM >> RW1
MMP_LOCKM >> 2345
MMP_CBEGIN >> [BEGIN_SED_EXTPLUGIN_CONFIG]
MMP_CEND >> [END_SED_EXTPLUGIN_CONFIG]
<!-- END: TPL_MARKS_GENOA -->
------------------------------------------------
<!-- BEGIN: TPL_MARKS_SIENA -->
MMP_PLUGNAME >> {PHP.pfname}
MMP_PLUGDATE >> {PHP|date("Y-M-d")}
MMP_VARPREFIX >> {PHP.pfname}_
MMP_PLUGFILE >> {PHP.pfname}
MMP_HOOK >> standalone
MMP_PLUGTITLE >> Plugin title
MMP_PLUGDESC >> Plugin Description
MMP_PLUGPART >>
MMP_TAGS >> example.tpl:{EXAMPLE_TAG}
MMP_COPYRIGHT >> Copyright (c) 2011-{PHP|date("Y")}
MMP_AUTHOR_NAME >> {PHP.cfg.plugin.extension_template.author}
MMP_NOTES >> If your enjoy my plugin please consider donating to help support future developments. <b>Thanks!</b> <br /> <a href="mailto:{PHP.cfg.plugin.extension_template.email}">{PHP.cfg.plugin.extension_template.email}</a>
MMP_LICENSE >> Distributed under {PHP.cfg.plugin.extension_template.licence} license.
MMP_PLUGLANG >> en
MMP_PLUGPATH >> plugins
MMP_VERSION >> {PHP.cfg.plugin.extension_template.version}
MMP_LANGDESC >>
MMP_PLBEGIN >> [BEGIN_COT_EXT]
MMP_PLEND >> [END_COT_EXT]
MMP_VAR.NAME >>test
MMP_VAR.VALUE >> TEST
MMP_PBEGIN >> [BEGIN_COT_EXT_CONFIG]
MMP_PEND >> [END_COT_EXT_CONFIG]
MMP_PBEGIN_STRUCT >> [BEGIN_COT_EXT_CONFIG_STRUCTURE]
MMP_PEND_STRUCT >> [END_COT_EXT_CONFIG_STRUCTURE]
MMP_PLUGORDER >> 10
MMP_SEDMARK >> COT_
MMP_CODEMARK >> COT_CODE
MMP_DIEMARK >> Wrong URL
MMP_SQL >>
MMP_AUTHG >> R1
MMP_LOCKG >> W2345A
MMP_AUTHM >> RW1
MMP_LOCKM >> 2345
<!-- END: TPL_MARKS_SIENA -->
<!-- BEGIN: ERROR -->
<!-- END: ERROR -->

<!-- BEGIN: RESULTS -->

<!-- END: MAIN -->