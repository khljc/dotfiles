return{
        'akinsho/org-bullets.nvim',
        config = function()
            require('org-bullets').setup {
                concealcursor = false, -- Show underlying characters when cursor is on a line
                symbols = {
                    list = "•",
                    headlines = { "◉", "○", "✸", "✿" }, -- Default symbols
                    -- Example of a custom function for headlines
                    headlines = function(default_list)
                        table.insert(default_list, "♥")
                        return default_list
                    end,
                    -- Disable specific symbols
                    -- headlines = false,
                    -- Custom headlines with highlight groups
                    headlines = {
                        { "◉", "MyBulletL1" },
                        { "○", "MyBulletL2" },
                        { "✸", "MyBulletL3" },
                        { "✿", "MyBulletL4" },
                    },
                    checkboxes = {
                        half = { "", "@org.checkbox.halfchecked" },
                        done = { "✓", "@org.keyword.done" },
                        todo = { "˟", "@org.keyword.todo" },
                    },
                }
            }
        end
    }
