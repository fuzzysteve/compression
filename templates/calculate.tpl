{extends file='layout.tpl' }
{block name=title}Mineral Selection{/block}
{block name=body}
<p>If there's no result below, your constraints are too tight to allow a solution</p>
{if $solution == 0 }
<h2>Solutions</h2>
<table class='table-striped table table-bordered'>
<thead>
<tr><th>Module Type</th><th>Quantity</th><th>Volume</th></tr>
</thead>
<tbody>
{foreach $modules as $module}
    <tr><td>{$module[0]}</td><td class='text-right'>{$module[1]}</td><td class='text-right'>{$module[2]}</td></tr>
{/foreach}
</tbody>
<tfoot>
<tr><th colspan=2>Total Volume</th><td class='text-right'>{$volume} M<sup>3</sup></td></tr>
</table>
{else}
<p>No solution found. Try loosening up your maximums</p>
{/if}
<hr>
<h2>Requirements</h2>
<table class="table table-striped table-bordered">
<tr><th>Mineral</th><th>Required</th><th>Extra</th></tr>
<tr><th>Tritanium</th><td>{$requirements[0]}</td><td>{$overage[0]}</td></tr>
<tr><th>Pyerite</th><td>{$requirements[1]}</td><td>{$overage[1]}</td></tr>
<tr><th>Mexallon</th><td>{$requirements[2]}</td><td>{$overage[2]}</td></tr>
<tr><th>Isogen</th><td>{$requirements[3]}</td><td>{$overage[3]}</td></tr>
<tr><th>Nocxium</th><td>{$requirements[4]}</td><td>{$overage[4]}</td></tr>
<tr><th>Zydrine</th><td>{$requirements[5]}</td><td>{$overage[5]}</td></tr>
<tr><th>Megacyte</th><td>{$requirements[6]}</td><td>{$overage[6]}</td></tr>
<tr><th>Morphite</th><td>{$requirements[7]}</td><td>{$overage[7]}</td></tr>
</table>
{/block}
