{extends file='layout.tpl' }
{block name=title}Mineral Selection{/block}
{block name=body}
<p>Put in your skills, facilities available, and minerals required (Eventually you'll be able to save skills, if desired) and you'll get back the compressed ores which best fit that set. The maximum extra is so you can limit the overage on Ores. -1 means 'as much as you have to'
<form action="ice-calculate.php" method="POST">
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
<table class=table>
<thead>
<tr><th>Resource Type</th><th>Required Quantity</th><th>Maximum Extra</th></tr>
</thead>
<tbody>
<tr><th>Heavy Water</th><td><input width=100% name="hw" type="number" placeholder=0></td><td><input width=100% name="hwextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Liquid Ozone</th><td><input width=100% name="lo" type="number" placeholder=0></td><td><input width=100% name="loextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Helium Isotopes</th><td><input width=100% name="heiso" type="number" placeholder=0></td><td><input width=100% name="heisoextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Strontium Clathrates</th><td><input width=100% name="sc" type="number" placeholder=0></td><td><input width=100% name="scextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Hydrogen Isotopes</th><td><input width=100% name="hyiso" type="number" placeholder=0></td><td><input width=100% name="hyisoextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Oxygen Isotopes</th><td><input width=100% name="oxyiso" type="number" placeholder=0></td><td><input width=100% name="oxyisoextra" type="number" placeholder=0 value=-1></td></tr>
<tr><th>Nitrogen Isotopes</th><td><input width=100% name="nitroiso" type="number" placeholder=0></td><td><input width=100% name="nitroisoextra" type="number" placeholder=0 value=-1></td></tr>
</tbody>
<tfoot>
<tr><th colspan=3><input type="submit" placeholder="Calculate"</th></tr>
</table>
</form>
{/block}
