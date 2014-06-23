(1..3).each do |index|
  proxy "/tests/#{index}_fail.html", "sample/test.html", locals: { index: index, status: :fail }
  proxy "/tests/#{index}_pass.html", "sample/test.html", locals: { index: index, status: :pass }
end

helpers do
  def sample_range
    (1..3)
  end

  def load_test(index)
    load_file('tests', index)
  end

  def load_code(index, status)
    return "" if index == 1 && status == :fail
    index = index - 1 if status == :fail
    load_file('code', index)
  end

  def load_refactor(index)
    load_file('refactor', index) rescue ""
  end

  def load_file(dir, index)
    File.read File.join(root, 'source', 'sample', dir, "#{index}.js")
  end

  def has_refactor_file?(index)
    load_refactor(index).length > 0
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

configure :build do
  ignore 'sample/test.html'
  activate :relative_assets
  set :relative_links, true
end
