return {
  -- ملحق لإغلاق وسوم HTML تلقائياً
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require('nvim-ts-autotag').setup()
    end
  },
}
