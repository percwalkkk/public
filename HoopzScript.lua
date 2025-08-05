local key = 'lolapoal'

if key == 'lolapoal' then
-- Do not save this file
-- Always use the loadstring 
  _bsdata0 = {{4136402375,1754372417,388692},2025117705,785507,"\241\0\0\0","BC1E03E!1B10D3!62D!44-C661EA0E3BHBC-F!20D0401EAE!E3FHD-116A!H1AEDDE3H5D233!FHBF!E-DAF!B0H23EAEFB5E1A25F14F4C-4!AD30A02!0!F63A1","3fa6ec5aba904b8bda55e532b1489729b4a6164142a67f3a4adda819a4ad669cd344daad7207945d63deb0aa4945d587640ca12920b18fcb50d8fa5e9dad6fb3419993fb0bf87f866c83529947b4a13c628bb158255ccb40c2128479a4c16e9f76ff2f998f44320deab71090c2a9daf017019d0a1612863bf0bd15c949e525b346522bff07c6cce9e49c2886ac3caa4a6842c562b8772b9444a5f8129ed098fc1967c11146408840f77607eddb62bce8e6ae2cb06790f38cf0da357a047c52f168e67974d8d1cd461e2853"};
pcall(function() delfile('bf15a15feb3e074f81db01496cbb48e2-cache.lua') end)
  local a pcall(function()a=readfile("static_content_130525/initv4.lua")end) if a and #a>2000 then a=loadstring(a) end;
if a then return a() else pcall(makefolder, "static_content_130525") a=game:HttpGet("https://cdn.luarmor.net/v4_init_may312.lua") writefile("static_content_130525/initv4.lua", a) pcall(delfile, "static_content_130525/init.lua"); pcall(delfile, "static_content_130525/initv2.lua"); pcall(delfile, "static_content_130525/initv3.lua"); loadstring(a)() end
end
