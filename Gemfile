source "https://rubygems.org"

ruby "3.3.4"

gem "github-pages", "~> 232", group: :jekyll_plugins
gem "webrick"
gem "minima"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
end

# Windows and JRuby does not include zoneinfo files, so bundle the tzinfo-data gem
# and associated library.
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo"
  gem "tzinfo-data"
end
