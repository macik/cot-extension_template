# plugname.header.tpl
<!-- BEGIN: MAIN -->
{PHP.TAG}
/* ====================
{MMP_PLBEGIN}
Hooks=header.first
{MMP_PLEND}
==================== */

/**
 * {MMP_PLUGTITLE}
 *
{FILE "{PHP.snippets}/phpdoc.snippet.tpl"}
 */

defined('{MMP_CODEMARK}') or {FILE "{PHP.snippets}/die.snippet.tpl"}

$plug_name = '{MMP_PLUGNAME}';




<!-- END: MAIN -->