source "https://rubygems.org"

# Hello! This is where you manage which Jekyll version is used to run.
# When you want to use a different version, change it below, save the
# file and run `bundle install`. Run Jekyll with `bundle exec`, like so:
#
#     bundle exec jekyll serve
#
# This will help ensure the proper Jekyll version is running.
# Happy Jekylling!

gem "github-pages", group: :jekyll_plugins

# If you want to use Jekyll native, uncomment the line below.
# To upgrade, run `bundle update`.

# gem "jekyll"

gem "wdm", "~> 0.1.0" if Gem.win_platform?

# Security updates - updated by Claude Code on 2026-02-18:
# Nokogiri: Updated to fix multiple CVEs (CVE-2024-40896, CVE-2024-34459, CVE-2025-*)
gem "nokogiri", ">= 1.16.0"
# Kramdown: Updated to fix CVE-2020-14001 (Critical RCE vulnerability)
gem "kramdown", ">= 2.3.0"
# ActiveSupport: Updated to fix CVE-2023-22796, CVE-2023-28120, CVE-2023-38037
gem "activesupport", ">= 7.0.0"

# If you have any plugins, put them here!
group :jekyll_plugins do
  # gem "jekyll-archives"
  gem "jekyll-feed"
  gem 'jekyll-sitemap'
  gem 'hawkins'
end
