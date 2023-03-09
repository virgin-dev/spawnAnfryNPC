RegisterCommand('PedSpawn', function()
    local playerPed = PlayerPedId()
    local heading = GetEntityHeading(playerPed)
    local model = 'csb_cop'
    local pedtypes = 1
    local hashkey = GetHashKey(model)
    local coords = GetEntityCoords(PlayerPedId()) + 3, 3, 0
    RequestModel(hashkey)

    while not HasModelLoaded(hashkey) do
      Wait(100)
    end
  
    TriggerServerEvent('spawnPed', pedtypes, hashkey, coords, heading)
end)

RegisterNetEvent('setPedArmor', function(networkId)
    if NetworkDoesEntityExistWithNetworkId(networkId) then 
        local ped = NetworkGetEntityFromNetworkId(networkId)
        SetPedArmour(ped, 100)
        print(GetPedArmour(ped))
    else 
        print("NetworkDoesEntityExistWithNetworkId = false")
    end
end)