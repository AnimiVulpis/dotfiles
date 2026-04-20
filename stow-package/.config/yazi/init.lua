function Linemode:btime()
    local time = math.floor(self._file.cha.btime or 0)
    if time == 0 then
        return ""
    elseif os.date("%Y", time) == os.date("%Y") then
        return os.date("%m-%d %H:%M", time)
    else
        return os.date("%Y-%m-%d", time)
    end
end

function Linemode:mtime()
    local time = math.floor(self._file.cha.mtime or 0)
    if time == 0 then
        return ""
    elseif os.date("%Y", time) == os.date("%Y") then
        return os.date("%m-%d %H:%M", time)
    else
        return os.date("%Y-%m-%d", time)
    end
end

Status:children_add(function()
    local h = cx.active.current.hovered
    if not h or not h.cha or not h.cha.mtime then
        return ""
    end

    return ui.Line {
        ui.Span(os.date("%Y-%m-%d %H:%M", math.floor(h.cha.mtime or 0))),
        " ",
    }
end, 500, Status.RIGHT)
