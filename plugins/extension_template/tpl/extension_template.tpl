<!-- BEGIN: MAIN -->
<script type="text/javascript">
$(document).ready( function() {
        //$('.etabs').tabs();
        $('div[id^=tab]').hide();
        $('#tab1').show();
        $('ul.tabslist>li>a').bind('click',function(){
			var hr = $(this).attr('href');
			$('div[id^=tab]').hide(500);
        	$(hr).show(500);
        	console.log(hr);
        	return false;
        });

        $('div.panes').show(200);
        $('input[name=plugtyp]').bind('click',function(){
        	ajaxSend({url:'{PHP.ajax_link}'+'&mode='+$(this).val(),method:'POST',data:'x={PHP.sys.xk}',divId:'tpl_prm'});
        });

        $('input[name=plugtyp]').bind('change',function(){
        	var options = {};
        	$( "div.panes" ).hide( 'fade', options, 300, function(){
                if ($('#rt_2').attr('checked')) {
                	$('#pdirs').val('inc,img,lib,js,tpl');
                } else {
                	$('#pdirs').val('inc,img,js,tpl');
                }
                $('input[name=plugtyp]').each(function(){
                	//console.log($(this).attr('checked'));
                    if ($(this).attr('checked')) {
                        $('div[id^='+$(this).val()+']').show();
                    } else {
                        $('div[id^='+$(this).val()+']').hide();
                    }
                });
        	});

            $( "div.panes" ).show( 'fade', options, 300 );
       });
});
</script>
<form id="frm1" name="frm1" action="{PHP|cot_url('admin','m=other&p=extension_template&a=step2')}" method="post" style="margin-top:35px;">
<div class="typeselect">
<p><b>{PHP.L.mplug_select}:</b></p>
<!-- BEGIN: INPUT_TYP -->
<input id="rt_{in.id}" type="radio" name="plugtyp" value="{in.typ}"{in.check}><label for="rt_{in.id}"> {in.desc}</label><br/>
<!-- END: INPUT_TYP -->
</div>
<div class="etabs">
<ul class="tabslist">
	<li><a class="button special" href="#tab1">{PHP.L.mplug_stage1}</a></li>
	<li><a class="button" href="#tab2">{PHP.L.mplug_stage2}</a></li>
</ul>
<div class="panes" style="display: none;">
<div class="mtab block" id="tab1">
    <h3>{PHP.L.mplug_stage1}</h3>
    <div id="options">
    <div id="nameopt"><strong>{PHP.L.mplug_name}</strong><br />
        <input id="pni" name="plf[name]" type="text" value="plug_filename" onkeyup="$('.ttl').text(this.value); $('#id_1').val(this.value);$('#id_3').val(this.value+'_'); $('#id_4').val(this.value);" />
{PHP.L.mplug_name2}<br /><br />
{PHP.L.mplug_category}: {PHP.ext_cat_selector}
</div>
<div id="mainopt">
    <div class="chk"><input id="makedirs" checked="checked" type="checkbox" name="plf[makedirs]" value="1" onchange="if ($('#makedirs').attr('checked')) {$('#spdirs').show(100);} else {$('#spdirs').hide(100);}" />
    &nbsp;<strong>{PHP.L.mplug_folders}</strong><br />
    <span id="spdirs" class="mrg"><input id="pdirs" name="plf[dirsname]" type="text" value="inc,img,js,lib,tpl" /> {PHP.L.mplug_subfolders}</span>
    </div>
    <div class="chk"><input id="makelang" checked="checked" type="checkbox" name="plf[lang]" value="1" onchange="if ($('#makelang').attr('checked')) {$('#splang').show(100);} else {$('#splang').hide(100);}" />
    &nbsp;<strong>{PHP.L.mplug_lang}</strong><br />
    <span id="splang" class="mrg"><input id="plang" name="plf[langlist]" type="text" value="ru,en" /> {PHP.L.mplug_langdesc}</span>
    <br /><span class="ttl mrg">plug_filename</span>.*.lang.php
    </div>
  <!--    <span class="ttl mrg">plug_filename</span>.en.lang.php<br />
    <span class="ttl mrg">plug_filename</span>.ru.lang.php</div> -->
    <div class="chk"><input checked="checked" type="checkbox" name="plf[main]" value="1" />
    &nbsp;<strong>{PHP.L.mplug_main}</strong><br />
    <span class="ttl mrg">plug_filename</span>.php</div>
<div id="sed_setup" class="chk"><input checked="checked" type="checkbox" name="plf[setup]" value="1" />
    &nbsp;<strong>{PHP.L.mplug_setup}</strong>
    <br /><span class="ttl mrg">plug_filename</span>.setup.php</div><br/>
    <div id="SIENA_setup" class="chk" style="display:block;">
        <input class="add" type="checkbox" name="plf[siena][configure.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.configure.sql<br/>
        <input class="add" type="checkbox" name="plf[siena][configure.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.configure.php<br/>
        <input class="add" type="checkbox" name="plf[siena][install.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.install.sql<br/>
        <input class="add" type="checkbox" name="plf[siena][install.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.install.php<br/>
        <input class="add" type="checkbox" name="plf[siena][uninstall.sql]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.uninstall.sql<br/>
        <input class="add" type="checkbox" name="plf[siena][uninstall.php]" value="1" />&nbsp;setup/<span id="plug_ttl" class="ttl">plug_filename</span>.uninstall.php<br/>
    </div>
</div>
<div id="addon"><strong>{PHP.L.mplug_addon}</strong> (ajax, header, tools, rc, ...):
    &nbsp;<a href="#" onClick="addF(); return false;">({PHP.L.Add})</a><br />
    <label for="addon_0"><input id="addon_0" class="add" type="checkbox" name="plug[0][used]" value="1" />
    &nbsp;<span id="plug_ttl" class="ttl">plug_filename</span></label>.<input name="plug[0][name]" type="text" value="header" />
<div id="cf"></div>
</div>
<div id="SIENA_res"  style="display:block;" class="chk"><strong>{PHP.L.mplug_common}</strong> (functions, resource):<br/>
    <input class="add" type="checkbox" name="plf[siena][functions.php]" value="1" />
    &nbsp;inc/<span id="plug_ttl" class="ttl">plug_filename</span>.functions.php<br/>
    <input class="add" type="checkbox" name="plf[siena][resources.php]" value="1" />
    &nbsp;inc/<span id="plug_ttl" class="ttl">plug_filename</span>.resources.php<br/>
</div>
<div id="SIENA_md"  style="display:block;" class="chk"><strong>{PHP.L.mplug_mdfiles}</strong><br/>
    <input checked="checked" class="add" type="checkbox" name="plf[misc][readme.md]" value="1" />
    &nbsp;README.md - {PHP.L.mplug_mddesc}<br/>
    <input class="add" type="checkbox" name="plf[misc][versions.md]" value="1" />
    &nbsp;versions.md - {PHP.L.mplug_mdvers}<br/>
</div>

</div>
</div>

<div class="mtab block" id="tab2">
<h3>{PHP.L.mplug_params}:</h3>
<div id="tpl_prm">
{PRM}
</div>
<div></div>
<br />
</div>
</div>
</div>

<p class="valid"><input class="submit" type="submit" name="n" value="{PHP.L.mplug_goto2}" /></p>
</form>

<script type="text/javascript">
 function addF(){
   var i=$('div[id^="dyn"]').length+1;
   var w="'";
   var pni = $('#pni').val();
   $('#cf').append('<div id="dyn'+i+'"><label for="addon_'+i+'"><input id="addon_'+i+'" class="add" type="checkbox" name="plug['+i+'][used]" value="1" />&nbsp;&nbsp;<span class="ttl">'+pni+'</span></label>.<input name="plug['+i+'][name]" type="text" value="header" /><a href="#" onClick="$('+w+'#dyn'+i+w+').remove(); return false;">({PHP.L.Delete})</a></div>');
 }
</script>
<!-- END: MAIN -->
-----------------------------------------------
<!-- BEGIN: LOG -->
<div class="block">
	<h3>{PHP.L.mplug_creating}</h3>
	<ul class="log">
<!-- BEGIN: LINE -->
<li class="line">{logline}</li>
<!-- END: LINE -->
	</ul>
<!-- BEGIN: ERROR -->
<div class="error">{err_msg}</div>
<!-- END: ERROR -->
	<br />
	<a href="{PHP.scriptname}">{PHP.L.mplug_back}</a>
</div>
<!-- END: LOG -->
-----------------------------------------------
<!-- BEGIN: PRM -->
<!-- BEGIN: INPUT_PRM -->
<input id="id_{in.num}" name="prm_{in.num}" type="text" size="40" value="{in.val}">
<label for="id_{in.num}">&nbsp;{in.text}</label><br />
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
MMP_NOTES >> If your enjoy my plugin please consider donating to help support future developments. Thanks! mailto:{PHP.cfg.plugin.extension_template.email}
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