require 'irbtools'
require 'irbtools/more'
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
IRB.conf[:USE_AUTOCOMPLETE] = true
