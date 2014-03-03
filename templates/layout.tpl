{nocache}
<html>
  <head>
    <title>Compression Calculator - {block name=title}{/block}</title>
    <link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <link href="/blueprints/main.css" rel="stylesheet" type="text/css"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.24/jquery-ui.min.js"></script>
    <link href="//ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="//ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="/blueprints/dataTables.currencySort.js"></script>
    <script type="text/javascript" src="/blueprints/ColVis.min.js"></script>
{block name=extrajavascript}{/block}


{include file='file:/home/web/fuzzwork/htdocs/bootstrap/header.php' }
</head>
<body {block name=bodyattributes}{/block}>
{include file='file:/home/web/fuzzwork/htdocs/menu/menubootstrap.php' }
<div class='container'>
{block name=body}{/block}
</div>
{include file='file:/home/web/fuzzwork/htdocs/bootstrap/footer.php' }
{/nocache}
