
<div class="row">
<form class="form-horizontal protoform" id="sample_search" action="index.php" method="GET">
<input id="moduleBase" type="hidden" name="moduleBase" value="{if strlen($moduleBase)>0}{$moduleBase}{else}sample{/if}">
<input id="action" type="hidden" name="action" value="{if strlen($action)>0}{$action}{else}List{/if}">
<input id="isSearch" type="hidden" name="isSearch" value="1">
<div class="form-group">
<label for="name" class="col-md-2 control-label">uid ou identifiant :</label>
<div class="col-md-4">
<input id="name" type="text" class="form-control" name="name" value="{$sampleSearch.name}">
</div>
<label for="project_id" class="col-md-2 control-label">Projet :</label>
<div class="col-md-4">
<select id="project_id" name="project_id" class="form-control">
<option value="" {if $sampleSearch.project_id == ""}selected{/if}>{$LANG.appli.2}</option>
{section name=lst loop=$projets}
<option value="{$projets[lst].project_id}" {if $projets[lst].project_id == $sampleSearch.project_id}selected{/if}>
{$projets[lst].project_name}
</option>
{/section}
</select>
</div>
</div>

<label for="sample_type_id" class="col-md-2 control-label">Type :</label>
<div class="col-md-4">
<select id="sample_type_id" name="sample_type_id" class="form-control">
<option value="" {if $sampleSearch.sample_type_id == ""}selected{/if}>Sélectionnez...</option>
{section name=lst loop=$sample_type}
<option value="{$sample_type[lst].sample_type_id}" {if $sample_type[lst].sample_type_id == $sampleSearch.sample_type_id}selected{/if} title="{$sample_type[lst].sample_type_description}">
{$sample_type[lst].sample_type_name}
</option>
{/section}
</select>
</div>
</div>
<div class="form-group">
<label for="limit" class="col-md-2 control-label">Nbre limite à afficher :</label>
<div class="col-md-4">
<input type="number" id="limit" name="limit" value="{$sampleSearch.limit}" class="form-control">
</div>
<div class="col-md-6">
<input type="submit" class="btn btn-success" value="{$LANG['message'][21]}">
</div>
</div>
</form>
</div>