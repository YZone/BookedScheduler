{*
Copyright 2011-2020 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
*}
<p><strong>Πληροφορίες κράτησης:</strong></p>

<p>
	<strong>Έναρξη:</strong> {formatdate date=$StartDate key=reservation_email}<br/>
	<strong>Λήξη:</strong> {formatdate date=$EndDate key=reservation_email}<br/>
	<strong>Τίτλος:</strong> {$Title}<br/>
	<strong>Περιγραφή:</strong> {$Description|nl2br}
    {if $Attributes|count > 0}
		<br/>
		{foreach from=$Attributes item=attribute}
			<div>{control type="AttributeControl" attribute=$attribute readonly=true}</div>
		{/foreach}
	{/if}
</p>

<p>
    {if $ResourceNames|count > 1}
		<strong>Πόροι ({$ResourceNames|count}):</strong>
		<br/>
        {foreach from=$ResourceNames item=resourceName}
            {$resourceName}
			<br/>
        {/foreach}
    {else}
		<strong>Πόρος:</strong>
        {$ResourceName}
		<br/>
    {/if}
</p>

{if $ResourceImage}
	<div class="resource-image"><img alt="{$ResourceName|escape}" src="{$ScriptUrl}/{$ResourceImage}"/></div>
{/if}

{if count($RepeatRanges) gt 0}
	<br/>
	<strong>Η κράτηση συμβαίνει στις ακόλουθες ημερομηνίες ({$RepeatRanges|count}):</strong>
	<br/>
    {foreach from=$RepeatRanges item=date name=dates}
        {formatdate date=$date->GetBegin()}
        {if !$date->IsSameDate()} - {formatdate date=$date->GetEnd()}{/if}
		<br/>
    {/foreach}
{/if}

<p>
    {if !empty($CreatedBy)}
		<strong>Διαγράφηκε από:</strong>
        {$CreatedBy}
		<br/>
		<strong>Αιτία διαγραφής: {$DeleteReason|nl2br}</strong>
    {/if}
</p>

<p><strong>Αριθμός αναφοράς:</strong> {$ReferenceNumber}</p>

<a href="{$ScriptUrl}">Κάνετε είσοδο στο {$AppTitle}</a>