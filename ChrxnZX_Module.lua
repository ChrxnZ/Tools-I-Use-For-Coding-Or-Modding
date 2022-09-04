-- general search and edit
local sn = gg.searchNumber
local cr = gg.clearResults
local ed = gg.editAll


-- script control
local al = gg.alert
local to = gg.toast
local iv = gg.isVisible
local sv = gg.setVisible
local gr = gg.getResults
local sr = gg.setRanges
local sl = gg.sleep

-- types
local tpa = gg.TYPE_AUTO
local tpd = gg.TYPE_DWORD
local tpf = gg.TYPE_FLOAT
local tpe = gg.TYPE_DOUBLE
local tpw = gg.TYPE_WORD
local tpb = gg.TYPE_BYTE
local tpq = gg.TYPE_QWORD
local tpx = gg.TYPE_XOR


-- regions
local jh = gg.REGION_JAVA_HEAP
local ch = gg.REGION_C_HEAP
local ca = gg.REGION_C_ALLOC
local cd = gg.REGION_C_DATA
local cb = gg.REGION_C_BSS
local ps = gg.REGION_PPSSPP
local a = gg.REGION_ANONYMOUS
local j = gg.REGION_JAVA
local s = gg.REGION_STACK
local as = gg.REGION_ASHMEM
local v = gg.REGION_VIDEO
local o = gg.REGION_OTHER
local b = gg.REGION_BAD
local xa = gg.REGION_CODE_APP
local xs = gg.REGION_CODE_SYS

-- os
local oe = os.exit




Module = {}

function Module.al(string_input)
    if string_input == nil then
        return al("No String Input Recieved")
    elseif string.len(string_input) >= 1 then
        return al(string_input)
    end
end

function Module.to(string_input)
    if string_input == nil then
        return to("No String Input Recieved")
    elseif string.len(string_input) >= 1 then
        return to(string_input)
    end
end

function Module.sn(value, data_type)
    if value == nil then
        return al("No Value Recieved")
    elseif data_type == nil then
        return al("No Data Type Recieved")
    else
        return sn(value .. " ," .. data_type)
    end
end

function Module.cr()
    return cr()
end

function Module.ed(value, data_type)
    if value == nil then
        return al("No Value Recieved")
    elseif data_type == nil then
        return al("No Data Type Recieved")
    else
        return ed(value .. " ," .. data_type)
    end
end

function Module.iv(bool_input)
    if bool_input == nil then
        return al("No Bool Input Recieved")
    elseif string.len(bool_input) >= 1 then
        return iv(bool_input)
    end
end

function Module.sv(bool_input)
    if bool_input == nil then
        return al("No Bool Input Recieved")
    elseif string.len(bool_input) >= 1 then
        return sv(bool_input)
    end
end

function Module.gr(int_input)
    if int_input == nil then
        return al("No Int Input Recieved")
    elseif string.len(int_input) >= 1 then
        Intn = tonumber(int_input)
        return gr(Intn)
    end
end

function Module.sr(region) -- doesnt support shortcuts (only types written like gg.REGION_region)
    if region == nil then
        return al("No Region Recieved")
    elseif string.len(region) >= 1 then
        sr(region)
    end
end

function Module.ssr(region) -- instead of typing gg.REGION_CODE_APP for example: you can type "xa" and the function will return gg.REGION_CODE_APP.
    if region == nil then
        return al("No Region Recieved")
    elseif string.len(region) >= 1 then
        if region == "jh" then
            return sr(jh)
        elseif region == "ch" then
            return sr(ch)
        elseif region == "ca" then
            return sr(ca)
        elseif region == "cd" then
            return sr(cd)
        elseif region == "cb" then
            return sr(cb)
        elseif region == "ps" then
            return sr(ps)
        elseif region == "a" then
            return sr(a)
        elseif region == "j" then
            return sr(j)
        elseif region == "s" then
            return sr(s)
        elseif region == "as" then
            return sr(as)
        elseif region == "v" then
            return sr(v)
        elseif region == "o" then
            return sr(o)
        elseif region == "b" then
            return sr(b)
        elseif region == "xa" then
            return sr(xa)
        elseif region == "xs" then
            return sr(xs)
        end
    end
end

function Module.sl(int_ms) -- supports milliseconds only
    if int_ms == nil then
        return al("No ms Amount Recieved")
    elseif string.len(int_ms) >= 1 then
        Intms = tonumber(int_ms)
        return sl(Intms)
    end
end

function Module.dt(type)
    if type == nil then
        return al("No Data Type Recieved")
    elseif string.len(type) >= 1 then
        if type == "tpa" then
            return tpa
        elseif type == "tpd" then
            return tpd
        elseif type == "tpf" then
            return tpf
        elseif type == "tpe" then
            return tpe
        elseif type == "tpw" then
            return tpw
        elseif type == "tpb" then
            return tpb
        elseif type == "tpq" then
            return tpq
        elseif type == "tpx" then
            return tpx
        end
    end
end

return Module