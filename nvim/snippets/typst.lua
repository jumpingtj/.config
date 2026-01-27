---@diagnostic disable: undefined-global

return {
	s({ trig = "mt", snippetType = "autosnippet" },
		fmta("$<>$", { i(1) })
	),
	s({ trig = "(%d+)r", regTrig = true },
		fmta([[
#for i in range(<>) {
	<>
}]], {
			f(function(_, s) return s.captures[1] end),
			i(1)
		})
	),
	s({ trig = "il" },
		fmta('#import "@local:"')
	)
}
