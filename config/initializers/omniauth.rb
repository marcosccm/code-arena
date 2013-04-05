github_conf = YAML.load(File.open(Rails.root.join('config/github_keys.yml')))
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, github_conf[:id], github_conf[:secret]
end
