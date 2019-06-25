module RailsMallocTrim
  class Railtie < Rails::Railtie
    config.before_initialize do
      RailsMallocTrim.enable_trimming if RailsMallocTrim.trimming_possible?
    end
  end
end
