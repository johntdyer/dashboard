module LabsRouting
  BASE_PATH = "config"
  $config = LabsRouting::Config.new(File.open("#{LabsRouting::BASE_PATH}/config.yml") { |file| YAML.load(file) })
end
