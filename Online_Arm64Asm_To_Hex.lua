local cho = gg.choice
local pr = gg.prompt
local mr = gg.makeRequest


main = cho({
  "Arm64 Asm To Hex",
  "Credits"
}, nil, "Script By Pulsed#1874")

if main == 1 then
  local asm_args = pr({
      "Arm64 Assembly:"
    },
    {[1] = "mov w0, #5000; ret"},
    {[1] = "Text"}
    )
  local response = mr("https://armconverter.com/api/convert", {
    ["content-type"] = "application/json"
    },  '{"asm": "' .. asm_args[1] .. '"}')
  local hex = tostring(response["content"]:match([[arm64.+true, ".+},]])):match([["%d+.+%d]]):match("%d+.+%d"):gsub([[\n]], "")
  print("Arm64 Assembly: " .. asm_args[1] .. "")
  print("Hex: " .. hex .. "")
end

if main == 2 then
  print("https://github.com/ChrxnZ")
end
