{extends file='layout.tpl' }
{block name=title}Mineral Selection{/block}
{block name=body}
<p>Mineral compression is the art of using modules to make your minerals take up less space than they would normally take up. This can be fairly significant.</p>
<p>Fill in the quantity of each mineral that you need (This assumes 100% return. bump your numbers if you don't have perfect refining). It'll try to keep to that number. Maximum extra is there as it's highly unlikely that you'll be dead on, but you'll be able to save on space, if you're willing to go over. </p>
<p>Put -1 in as your maxmium extra, if you're going for maximum compression and not caring about how much extra you might bring</p>
<p>See <a href="/compression/blueprints.php">the blueprint list</a> to see what modules might be used</p>
<form action="calculate.php" method="POST">
<table>
<thead>
<tr><th>Mineral Type</th><th>Required Quantity</th><th>Maximum Extra</th></tr>
</thead>
<tbody>
<tr><th>Tritanium</th><td><input width=100% name="trit" type="number" placeholder=0></td><td><input width=100% name="tritextra" type="number" placeholder=0></td></tr>
<tr><th>Pyerite</th><td><input width=100% name="pye" type="number" placeholder=0></td><td><input width=100% name="pyeextra" type="number" placeholder=0></td></tr>
<tr><th>Mexallon</th><td><input width=100% name="mex" type="number" placeholder=0></td><td><input width=100% name="mexextra" type="number" placeholder=0></td></tr>
<tr><th>Isogen</th><td><input width=100% name="iso" type="number" placeholder=0></td><td><input width=100% name="isoextra" type="number" placeholder=0></td></tr>
<tr><th>Nocxium</th><td><input width=100% name="nocx" type="number" placeholder=0></td><td><input width=100% name="nocxextra" type="number" placeholder=0></td></tr>
<tr><th>Zydrine</th><td><input width=100% name="zyd" type="number" placeholder=0></td><td><input width=100% name="zydextra" type="number" placeholder=0></td></tr>
<tr><th>Megacyte</th><td><input width=100% name="mega" type="number" placeholder=0></td><td><input width=100% name="megaextra" type="number" placeholder=0></td></tr>
<tr><th>Morphite</th><td><input width=100% name="morp" type="number" placeholder=0></td><td><input width=100% name="morpextra" type="number" placeholder=0></td></tr>
</tbody>
<tfoot>
<tr><th colspan=3><input type="submit" placeholder="Calculate"</th></tr>
</table>
</form>
{/block}
