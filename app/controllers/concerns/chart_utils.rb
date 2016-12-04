module ChartUtils
  def color_set(alpha: 1)
    [ "rgba(241,44,81,#{alpha})", "rgba(0,160,233,#{alpha})", "rgba(243,194,24,#{alpha})",
      "rgba(143,195,31,#{alpha})", "rgba(235,104,119,#{alpha})", "rgba(126,206,244,#{alpha})",
      "rgba(255,229,53,#{alpha})", "rgba(137,201,151,#{alpha})", "rgba(236,105,65,#{alpha})",
      "rgba(0,160,233,#{alpha})", "rgba(68,138,202,#{alpha})", "rgba(248,181,81,#{alpha})",
      "rgba(19,181,277,#{alpha})", "rgba(150,150,150,#{alpha})" ]
  end
end