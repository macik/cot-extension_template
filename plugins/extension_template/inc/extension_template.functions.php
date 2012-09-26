<?php
/**
 * Extension template plugin API
 * @package extension_template
 * @author Andrey Matsovkin
 * @copyright Copyright (c) 2008-2012
 * @license Distributed under BSD License.
 */

defined('COT_CODE') or die('Wrong URL');
require_once cot_langfile('extension_template', 'plug');
$plug_name = 'extension_template';

/**
 * Parses text for key => value pairs and makes Array
 * @param str $text - text to pare
 * @param str $delimiter - key-value delimiter
 * @param str $linebreak - lines delimiter
 */
function parseParams($text,$delimiter='>>',$linebreak=PHP_EOL){
    $arr = explode($linebreak, $text);
    $tpl_arr = array();
    foreach ($arr as $value) {
        list($mrk,$str) = explode($delimiter, $value);
        $tpl_arr[trim($mrk)]=trim($str);
    }
    return $tpl_arr;
}

$mode = cot_import('mode','G','ALP') ? cot_import('mode','G','ALP') : (cot_import('plugtyp','P','ALP') ? cot_import('plugtyp','P','ALP') : 'SIENA');

$pfname = 'plug_filename';

$tpl = new XTemplate(cot_tplfile($plug_name, 'plug'));

// setting up different params depend on mode (Genoa version or Siena)
$tpl->parse('TPL_MODES');
$tpl_modes = parseParams($tpl->text('TPL_MODES'));
if (!array_key_exists($mode, $tpl_modes)) {
    echo 'Wrong Mode settings: '.$mode; // TODO: fix i10n
    exit;
}
$mode_block = 'TPL_MARKS_'.strtoupper($mode);
// init array of tokens for selected mode (version)
$tpl->parse($mode_block);
$tpl_arr = parseParams($tpl->text($mode_block ));

$bold_tag = array('MMP_PLUGNAME','MMP_PLUGDATE','MMP_VARPREFIX','MMP_PLUGFILE','MMP_HOOK','MMP_PLUGPART','MMP_TAGS','MMP_PLUGTITLE','MMP_PLUGDESC');

$mode= strtolower($mode);

?>