{extends file='layout.tpl' }
{block name=title}Blueprints{/block}
{block name=extrajavacript}
{/block}
{block name=body}
<p>Below you'll find a list of the blueprints used by this tool. If you think I've missed an obvious one, let me know. The number I can use is limited (each one makes the puzzle a fair bit more complicated)</p>
<table class='table table-bordered' id='blueprints'>
<thead>
<tr><th>Module</th><th>Trit</th><th>Trit rate</th><th>Pye</th><th>Pye rate</th><th>Mex</th><th>Mex rate</th><th>Iso</th><th>Iso rate</th><th>Nocx</th><th>Nocx rate</th><th>Zyd</th><th>Zyd rate</th><th>Mega</th><th>Mega rate</th><th>Morph</th><th>Morph rate</th><th>Total rate</th><th>Volume</th></tr>
</thead>
<tbody>
{foreach $modules as $module}
    <tr><td>{$module[0]}</td><td class='text-right'>{$module[1]}</td><td class='text-right'>{$module[2]}</td><td class='text-right'>{$module[3]}</td><td class='text-right'>{$module[4]}</td><td class='text-right'>{$module[5]}</td><td class='text-right'>{$module[6]}</td><td class='text-right'>{$module[7]}</td><td class='text-right'>{$module[8]}</td><td class='text-right'>{$module[9]}</td><td class='text-right'>{$module[10]}</td><td class='text-right'>{$module[11]}</td><td class='text-right'>{$module[12]}</td><td class='text-right'>{$module[13]}</td><td class='text-right'>{$module[14]}</td><td class='text-right'>{$module[15]}</td><td class='text-right'>{$module[16]}</td><td class='text-right'>{$module[17]}</td><td class='text-right'>{$module[18]}</td></tr>
{/foreach}
</tbody>
</table>
{/block}
{block name=extraend}
{literal}
<script>
$(document).ready(function(){
$(function(){
$("#blueprints").dataTable({"bPaginate": false, "bFilter": true,"bInfo": false});
});
});
</script>
{/literal}
{/block}
