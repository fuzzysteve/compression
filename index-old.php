<?php

require_once('db.inc.php');
$typeid=34;
if(array_key_exists('typeid',$_GET) && is_numeric($_GET['typeid']))
{
$typeid=$_GET['typeid'];
}
?>
<html>
<head>
<title>Compression Advisor</title>

  <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<?php include('/home/web/fuzzwork/htdocs/bootstrap/header.php'); ?>
</head>
<body>
<?php include('/home/web/fuzzwork/htdocs/menu/menubootstrap.php'); ?>
<div class="container">



<?
if (array_key_exists('typeid',$_GET))
{
?>
<table border=1>
<tr><th>Item</th><th>Quantity of Material</th><th>Volume of item</th><th>Compression Rate, units per m3</th></tr>
<?

$sql='select prod.typeid typeid,prod.typeName name,quantity, prod.typename,prod.volume*prod.portionsize volume, quantity/(prod.volume*prod.portionsize) compression from invTypes mats,invTypeMaterials,invTypes prod,invBlueprintTypes bt left join dgmTypeAttributes on (bt.producttypeid=dgmTypeAttributes.typeid and attributeID=1692) where invTypeMaterials.materialTypeID=mats.typeID and mats.TypeID=? and invTypeMaterials.typeid=bt.producttypeid and prod.typeid=bt.producttypeid and bt.techLevel=1 and valueFloat is null and prod.published=1  and prod.typename not like "%II" and prod.typename not like "%Gas Cloud Harvester%"  and prod.typename not like "%Deactivated Station Key Pass%" and prod.typename not like "%Large Micro Jump Drive%" order by compression desc limit 20';

$stmt = $dbh->prepare($sql);

$stmt->execute(array($typeid));

while ($row = $stmt->fetchObject()){
if ($row->compression>100)
{
echo "<tr><td><a href='/blueprints/calc.php?bpid=".$row->typeid."'>".$row->name."</td><td align=right>".$row->quantity."</td><td align=right>".$row->volume."</td><td align=right>".floor($row->compression)."</td></tr>";
}
}

?>
</table>
<?
}
else
{
?>
<ul>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=34">Tritanium</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=35">Pyerite</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=36">Mexallon</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=37">Isogen</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=38">Nocxium</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=39">Zydrine</a>
<li><a href="//www.fuzzwork.co.uk/compression/index.php?typeid=40">Megacyte</a>
</ul>
<p>This tool is still in the experimental stage. Needs to have blueprints with extra materials eliminated. Otherwise, it's just about right.</p>
<?
}
?>
</div>
<?php include('/home/web/fuzzwork/htdocs/bootstrap/footer.php'); ?>

</body>
</html>
