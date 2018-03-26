<h2>Lieux de prélèvement</h2>
	<div class="row">
	<div class="col-md-6">
{if $droits.param == 1}
<a href="index.php?module=samplingPlaceChange&sampling_place_id=0">
{$LANG["appli"][0]}
</a>
{/if}
<table id="samplingPlaceList" class="table table-bordered table-hover datatable-export-paging " >
<thead>
<tr>
<th>Id</th>
<th>Nom</th>
<th>Code métier</th>
<th>Collection</th>
<th>Longitude</th>
<th>Latitude</th>
</tr>
</thead>
<tbody>
{section name=lst loop=$data}
<tr>
<td>{$data[lst].sampling_place_id}</td>
<td>
{if $droits.param == 1}
<a href="index.php?module=samplingPlaceChange&sampling_place_id={$data[lst].sampling_place_id}">
{$data[lst].sampling_place_name}
</a>
{else}
{$data[lst].sampling_place_name}
{/if}
</td>
<td>{$data[lst].sampling_place_code}</td>
<td>{$data[lst].collection_name}</td>
<td>{$data[lst].sampling_place_x}</td>
<td>{$data[lst].sampling_place_y}</td>
</tr>
{/section}
</tbody>
</table>
</div>
</div>

{if $droits["param"] == 1}
<div class="row col-md-6">
<fieldset>
<legend>Importer des emplacements depuis un fichier CSV</legend>
<form class="form-horizontal protoform" id="metadataImport" method="post" action="index.php" enctype="multipart/form-data">

<input type="hidden" name="module" value="samplingPlaceImport">
<div class="form-group">
<label for="upfile" class="control-label col-md-4">Nom du fichier à importer (CSV)<span class="red">*</span> :</label>
<div class="col-md-8">
<input type="file" name="upfile" required>
</div>
</div>
<div class="form-group">
<label for="separator" class="control-label col-md-4">Séparateur<span class="red">*</span> :</label>
<div class="col-md-8">
<select id="separator" class="form-control" name="separator">
<option value=";">point-virgule</option>
<option value=",">virgule</option>
<option value="t">tabulation</option>
</select>
</div>
</div>

<div class="form-group">
<label for="collection_id" class="control-label col-md-4">Collection éventuelle de rattachement :</label>
<div class="col-md-8">
<select id="collection_id" name="collection_id" class="form-control">
<option value="" {if $data["collection_id"] == ""} selected{/if}>Choisissez...</option>
{foreach $collections as $collection}
<option value="{$collection.collection_id}" {if $collection.collection_id == $data.collection_id} selected {/if}>
{$collection.collection_name}
</option>
{/foreach}
</select>
</div>
</div>
<div class="form-group center">
      <button type="submit" class="btn btn-primary">Importer les localisations</button>
</div>
<div class="bg-info">
Description du fichier :
<ul>
<li>name : nom de la station (obligatoire)</li>
<li>code : code métier de la station</li>
<li>x : longitude du point en projection WGS84, sous forme numérique (séparateur : point)</li>
<li>y : latitude du point</li>
</ul>
</div>
</form>
</fieldset>
</div>
{/if}
