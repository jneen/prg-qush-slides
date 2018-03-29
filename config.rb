load './lib/qsh.rb'



module HighlightingHelpers
  def code(lang, attrs={}, &b)
    content = capture_html(&b)
    lexer = Rouge::Lexer.find_fancy(lang)
    formatter = Rouge::Formatters::HTML.new
    html = formatter.format(lexer.lex(content))

    content_tag :pre, add_classes(attrs, 'highlight', lexer.tag) do
      html.html_safe
    end
  end

  private
  def add_classes(attrs, *classes)
    existing = case attrs[:class]
    when String then
      attrs[:class].split(/\s+/)
    when Array then
      attrs[:class]
    when nil then
      []
    end

    attrs.merge(:class => (existing + classes).join(' '))
  end
end

###
# Compass
###

# Susy grids in Compass
# First: gem install susy --pre
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end
# Haml::Template.options[:ugly] = true

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
helpers HighlightingHelpers

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :cache_buster

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
