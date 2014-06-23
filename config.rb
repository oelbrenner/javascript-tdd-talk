###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

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

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

(1..3).each do |index|
  proxy "/tests/#{index}_fail.html", "sample/test.html", locals: { index: index, status: :fail }
  proxy "/tests/#{index}_pass.html", "sample/test.html", locals: { index: index, status: :pass }
end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# configure :development do
#   activate :livereload
# end

helpers do
  def sample_range
    (1..3)
  end

  def code_for_failing_test(index)
    return "" if index == 1
    load_code(index - 1)
  end

  def load_test(index)
    load_file('tests', index)
  end

  def load_code(index, status)
    return "" if index == 1 && status == :fail
    index = index - 1 if status == :fail
    load_file('code', index)
  end

  def load_file(dir, index)
    File.read File.join(root, 'source', 'sample', dir, "#{index}.js")
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"
end
