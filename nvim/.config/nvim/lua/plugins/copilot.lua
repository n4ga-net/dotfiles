return {
	"github/copilot.vim",
	config = function()
		local ok, copilot = pcall(require, "copilot")
		if not ok then
			return
		end
	end,
}
