Shared = {
    Smoothness = {
        Wait = 500,
    },


    Debug = {
        enabled = true,

        Print = function(...)
            if Shared.Debug.enabled then
                print(string.format("[%s] >> %s", GetCurrentResourceName(), table.concat({...}, " ")))
            end
        end
    }
}