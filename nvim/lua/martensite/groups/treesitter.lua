return function(p)
  return {
    ['@string'] = { link = 'String' },
    ['@comment'] = { link = 'Comment' },
    ['@keyword'] = { link = 'Keyword' },
    ['@keyword.function'] = { fg = p.blue },
    ['@constant'] = { link = 'Constant' },
    ['@boolean'] = { link = 'Boolean' },
    ['@number'] = { link = 'Number' },
    ['@float'] = { link = 'Float' },

    ['@function'] = { fg = p.cyan },

    ['@markup.italic'] = { italic = true },
    ['@markup.bold'] = { bold = true },
    ['@markup.heading'] = { italic = true, bold = true, fg = p.blue },
    ['@markup.heading.2'] = { italic = true, fg = p.cyan },
    ['@markup.heading.3'] = { italic = true, fg = p.teal },
    ['@markup.heading.4'] = { italic = true, fg = p.green },
  }
end
