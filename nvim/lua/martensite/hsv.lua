return function(h, s, v)
  local C = v * s
  local m = v - C
  local r, g, b = m, m, m
  local h_ = (h % 1.0) * 6
  local X = C * (1 - math.abs(h_ % 2 - 1))
  C, X = C + m, X + m
  if h_ < 1 then
    r, g, b = C, X, m
  elseif h_ < 2 then
    r, g, b = X, C, m
  elseif h_ < 3 then
    r, g, b = m, C, X
  elseif h_ < 4 then
    r, g, b = m, X, C
  elseif h_ < 5 then
    r, g, b = X, m, C
  else
    r, g, b = C, m, X
  end
  -- return string.format('#%02x%02x%02x', r * 255, b * 255, g * 255)
  return string.format('#%02x%02x%02x', r, g, b)
end
