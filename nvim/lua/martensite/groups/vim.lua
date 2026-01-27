return function(p)
  return {
    Normal = { fg = p.fg, bg = p.bg },
    NormalNC = { fg = p.fg, bg = p.faded_bg },
    Visual = { bg = p.accent },
    LineNr = { fg = p.medium_grey },
    CursorLineNr = { fg = p.fg },
    CursorLine = { bg = p.accent },
    Comment = { fg = p.medium_grey },
    Keyword = { fg = p.purple },
    String = { fg = p.green },
    Constant = { fg = p.red },
    Boolean = { link = 'Constant' },
    Number = { link = 'Constant' },
    Float = { link = 'Number' },
  }
end
