local VORPcore = exports.vorp_core:GetCore()

exports.vorp_inventory:registerUsableItem(Config.Joint, function(data)
	exports.vorp_inventory:closeInventory(data.source)
	TriggerClientEvent('xakra_drugs:JointAnim', data.source)
end)

exports.vorp_inventory:registerUsableItem(Config.Opium, function(data)
	exports.vorp_inventory:closeInventory(data.source)

	local itemCount = exports.vorp_inventory:getItemCount(data.source, nil, Config.OpiumPipe)
	if itemCount >= 1 then
		TriggerClientEvent('xakra_drugs:Opium', data.source)
	else
		VORPcore.NotifyLeft(data.source, Config.OpiumTxt['Opium'], Config.OpiumTxt['NeedPipe'], 'generic_textures', 'lock', 3000, "COLOR_PURE_WHITE")
	end
end)

exports.vorp_inventory:registerUsableItem(Config.Mushroom, function(data)
	exports.vorp_inventory:closeInventory(data.source)
	TriggerClientEvent('xakra_drugs:Mushroom', data.source)
end)

RegisterServerEvent('xakra_drugs:SubItem')
AddEventHandler('xakra_drugs:SubItem', function(item, amount)
	local _source = source
	exports.vorp_inventory:subItem(_source, item, amount)
end)