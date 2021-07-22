require "options"

local async
async =
    vim.loop.new_async(
    vim.schedule_wrap(
        function()
            require "pluginList"
	    require "plugins.bufferline"
	    vim.cmd("e")
            async:close()
        end
    )
)
async:send()
