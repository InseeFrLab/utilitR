--[[
    A Pandoc lua filter that inserts non breaking spaces
    compliant with the French typography.

    Requirements: Pandoc >= 2.9.2
--]]

Inlines = function(inlines)
  local i = 1

  while inlines[i+2] do
    if inlines[i].t == 'Str' and inlines[i+1].t == 'Space' and inlines[i+2].t == 'Str' then
      if string.match(inlines[i+2].c,  "^[;!%?%%€]")
      or string.match(inlines[i].c, "%d$") and string.match(inlines[i+2].c, "^%d%d%d[^%d]*")
      or string.match(inlines[i].c, "°$") and string.match(inlines[i+2].c, "^%d")
      or string.match(inlines[i].c, "^[+-]$") and string.match(inlines[i+2].c, "^%d") then
        inlines[i].c = inlines[i].c .. "\u{202f}" .. inlines[i+2].c
        inlines:remove(i+2)
        inlines:remove(i+1)
      elseif string.match(inlines[i+2].c,  "^:")
      or string.match(inlines[i].c, "%d$") and string.match(inlines[i+2].c, "^ans.*$") then
        inlines[i].c = inlines[i].c .. "\u{00a0}" .. inlines[i+2].c
        inlines:remove(i+2)
        inlines:remove(i+1)
      else
        i = i+1
      end
    else
      i = i+1
    end
  end

  return inlines
end
--[[
Quoted = function(elem)
  if elem.quotetype ~= "DoubleQuote" then return nil end

  local content = elem.content
  content[1].c = "\u{00ab}\u{00a0}" .. content[1].c
  content[#content].c = content[#content].c .. "\u{00a0}\u{00bb}"
  return content
end
--]]
