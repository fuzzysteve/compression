{extends file='layout.tpl' }
{block name=title}Mineral Selection{/block}
{block name=body}
<p>Put in your skills, facilities available, and minerals required (Eventually you'll be able to save skills, if desired) and you'll get back the compressed ores which best fit that set. The maximum extra is so you can limit the overage on Ores. -1 means 'as much as you have to'
<form action="calculate.php" method="POST">
<div class="panel-group" id="accordion">
<div class="panel-group" id="accordion">
<div class="panel panel-default">
<div class="panel-heading">
<h4 class="panel-title">
<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
Things affecting reprocessing
</a>
</h4>
</div>
<div id="collapseOne" class="panel-collapse collapse">
<div class="panel-body">
<table class=table>
<thead>
<tr><th>Skill</th><th>Skill level</th></tr>
</thead>
<tbody>
<tr><th>Refining</th><td><select name='skill-3385'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Refining Efficiency</th><td><select name='skill-3389'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Arkonor Processing</th><td><select name='skill-12180'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Bistot Processing</th><td><select name='skill-12181'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Crokite Processing</th><td><select name='skill-12182'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Dark Ochre Processing</th><td><select name='skill-12183'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Gneiss Processing</th><td><select name='skill-12184'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Hedbergite Processing</th><td><select name='skill-12185'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Hemorphite Processing</th><td><select name='skill-12186'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Jaspet Processing</th><td><select name='skill-12187'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Kernite Processing</th><td><select name='skill-12188'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Mercoxit Processing</th><td><select name='skill-12189'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Omber Processing</th><td><select name='skill-12190'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Plagioclase Processing</th><td><select name='skill-12191'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Pyroxeres Processing</th><td><select name='skill-12192'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Scordite Processing</th><td><select name='skill-12193'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Spodumain Processing</th><td><select name='skill-12194'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Veldspar Processing</th><td><select name='skill-12195'><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
<tr><th>Ice Processing</th><td><select name='skill-18025'><option>0</option><option>1</option><option>2</option><option>3</option><option>4</option><option selected>5</option></select></td></tr>
</tbody>
<tbody>
<tr><th>Implant percentage</th><td><select name='implant'><option>0</option><option>1</option><option>2</option><option selected>4</option></select></td></tr>
<tr><th>Facility Percentage</th><td><select name='facility'>
<option>50</option>
<option>52</option>
<option>53</option>
<option selected>54</option>
<option>56</option>
<option>58</option>
<option>60</option>
<option value=52>Highsec T1</option>
<option value=54>Highsec T2</option>
<option value=55.12>Lowsec T1</option>
<option value=57.24>Lowsec T2</option>
<option value=58.24>Nullsec T1</option>
<option value=60.48>Nullsec T2</option>

</select></td></tr>
</tbody>
</table>
</div>
</div>
</div>
</div>
<label for='oretype'>Ore Restrictions</label> <select name='oretype' id='oretype'>
<option value='all'>All ores</option>
<option value='highsec'>Highsec Ores</option>
<option value='lns'>LNS Refine Ores</option>
<option value='nullsec'>Nullsec only Ores</option>
</select>
<table class=table>
<thead>
<tr><th>Mineral Type</th><th>Required Quantity</th><th>Maximum Extra</th></tr>
</thead>
<tbody>
<tr><th>Tritanium</th><td><input width=100% name="trit" type="number" placeholder=0></td><td><input width=100% name="tritextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Pyerite</th><td><input width=100% name="pye" type="number" placeholder=0></td><td><input width=100% name="pyeextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Mexallon</th><td><input width=100% name="mex" type="number" placeholder=0></td><td><input width=100% name="mexextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Isogen</th><td><input width=100% name="iso" type="number" placeholder=0></td><td><input width=100% name="isoextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Nocxium</th><td><input width=100% name="nocx" type="number" placeholder=0></td><td><input width=100% name="nocxextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Zydrine</th><td><input width=100% name="zyd" type="number" placeholder=0></td><td><input width=100% name="zydextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Megacyte</th><td><input width=100% name="mega" type="number" placeholder=0></td><td><input width=100% name="megaextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Morphite</th><td><input width=100% name="morp" type="number" placeholder=0></td><td><input width=100% name="morpextra" type="number" placeholder=0 value=-1></td></tr>
</tbody>
<tfoot>
<tr><th colspan=3><input type="submit" placeholder="Calculate"</th></tr>
</table>
</form>
{/block}
