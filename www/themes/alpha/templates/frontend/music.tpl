
{if {$site->adbrowse} != ''}
    <div class="container" style="width:500px;">
<fieldset class="adbanner div-center">
<legend class="adbanner">Advertisement</legend>
{$site->adbrowse}
</fieldset></div>
<br>
{/if}

<div class="panel">
<div class="panel-heading">
<h4 class="panel-title">
<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#searchtoggle">
<i class="icon-search"></i> Search Filter</a>
</a>
</h4>
</div>
<div id="searchtoggle" class="panel-collapse collapse">
<div class="panel-body">
{include file='search-filter.tpl'}
</div>
</div>
</div>


{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">
<div class="container nzb_multi_operations" style="text-align:right;margin-bottom:5px;">
View:
<span><i class="icon-th-list"></i></span>&nbsp;&nbsp;
<a href="{$smarty.const.WWW_TOP}/browse?t={$category}"><i class="icon-align-justify"></i></a>
{if $isadmin || $ismod}
&nbsp;&nbsp;
Admin: <input type="button" class="btn btn-warning nzb_multi_operations_edit" value="Edit">
<input type="button" class="btn btn-danger nzb_multi_operations_delete" value="Delete">
{/if}
</div>
{include file='multi-operations.tpl'}


<table class="table table-striped table-hover table-condensed data" id="coverstable">
<thead>
<tr>
<th><input type="checkbox" class="nzb_check_all"></th>
<th>artist <a title="Sort Descending" href="{$orderbyartist_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbyartist_asc}"><i class="icon-chevron-up"></i></a></th>
<th>year <a title="Sort Descending" href="{$orderbyyear_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbyyear_asc}"><i class="icon-chevron-up"></i></a></th>
<th>genre <a title="Sort Descending" href="{$orderbygenre_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbygenre_asc}"><i class="icon-chevron-up"></i></a></th>
<th>posted <a title="Sort Descending" href="{$orderbyposted_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbyposted_asc}"><i class="icon-chevron-up"></i></a></th>
<th>size <a title="Sort Descending" href="{$orderbysize_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbysize_asc}"><i class="icon-chevron-up"></i></a></th>
<th>files <a title="Sort Descending" href="{$orderbyfiles_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbyfiles_asc}"><i class="icon-chevron-up"></i></a></th>
<th>stats <a title="Sort Descending" href="{$orderbystats_desc}"><i class="icon-chevron-down"></i></a><a title="Sort Ascending" href="{$orderbystats_asc}"><i class="icon-chevron-up"></i></a></th>
</tr>
</thead>
<tbody>
{foreach from=$results item=result}
<tr>
<td style="width:150px;padding:10px;text-align:center;">
<div class="movcover">
<a class="title thumbnail" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">
<img class="shadow" src="{$smarty.const.WWW_TOP}/covers/music/{if $result.cover == 1}{$result.musicinfoid}.jpg{else}no-cover.jpg{/if}" alt="{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}">
</a>
</div>
<div class="relextra" style="margin-top:5px;">
{if $result.nfoid > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="label modal_nfo" rel="nfo">Nfo</a> {/if}
{if $result.url != ""}<a class="label" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.musicinfoid}" title="View amazon page">Amazon</a> {/if}
<a class="label" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a> 
</div>
</td>

<td colspan="7" class="left" id="guid{$result.guid}">
<h4><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.artist|escape:"htmlall"} - {$result.title|escape:"htmlall"}</a> (<a class="title" title="{$result.year}" href="{$smarty.const.WWW_TOP}/music?year={$result.year}">{$result.year}</a>)</h4>

{if $result.genre != ""}<b>Genre:</b> <a href="{$smarty.const.WWW_TOP}/music/?genre={$result.genreid}">{$result.genre|escape:"htmlall"}</a><br>{/if}
{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher|escape:"htmlall"}<br>{/if}
{if $result.releasedate != ""}<b>Released:</b> {$result.releasedate|date_format}<br>{/if}
{if $result.haspreview == 2 && $userdata.canpreview == 1}<b>Preview:</b> <a href="#" name="audio{$result.guid}" title="Listen to {$result.searchname|escape:"htmlall"}" class="audioprev" rel="audio">Listen</a><audio id="audprev{$result.guid}" src="{$smarty.const.WWW_TOP}/covers/audio/{$result.guid}.mp3" preload="none"></audio>{/if}
<div class="container">
<a class="label label-info" href="{$smarty.const.WWW_TOP}/music?artist={$result.artist|escape:"url"}" title="View similar nzbs">Similar</a>
{if $isadmin || $ismod}
<a class="label label-warning" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.releaseid}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release">Edit</a>
<a class="label confirm_action label-danger" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.releaseid}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release">Delete</a>
{/if}
</div>
<hr>
<div class="relextra">
<b>{$result.searchname|escape:"htmlall"}</b>
<div class="container">
<div class="icon"><input type="checkbox" class="nzb_check" value="{$result.guid}" /></div>
<div class="icon icon_nzb"><a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"htmlall"}">&nbsp;</a></div>
<div class="icon icon_cart" title="Add to Cart"></div>
{if $sabintegrated}<div class="icon icon_sab" title="Send to my Sabnzbd"></div>{/if}
&nbsp;&nbsp;&nbsp;&nbsp;
<i class="icon-calendar"></i> Posted {$result.postdate|timeago} | <i class="icon-hdd"></i> {$result.size|fsize_format:"MB"} | <i class="icon-file"></i> <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart} files</a> | <i class="icon-comments"></i> <a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments} cmts</a> | <i class="icon-download"></i> {$result.grabs} grabs 
</div>
</div>
</td>
</tr>
{/foreach}
</tbody>
</table>


{if $results|@count > 10}
<div class="nzb_multi_operations">
{include file='multi-operations.tpl'}
</div>
</form>
{/if}

{else}
<div class="alert">
<button type="button" class="close" data-dismiss="alert">&times;</button>
<strong>Sorry!</strong> Either some amazon key is wrong, or there is nothing in this section.
</div>
{/if}
