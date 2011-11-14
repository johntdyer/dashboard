module LabsRouting

  BASE_PATH = "#{Dir.home()}/.lab_routing"
  Dir.mkdir(BASE_PATH) unless Dir.exist?(BASE_PATH)
  $config = LabsRouting::Config.new(File.open("#{LabsRouting::BASE_PATH}/config.yml") { |file| YAML.load(file) })
end
