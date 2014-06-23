(1..3).each do |index|
  proxy "/tests/#{index}_fail.html", "sample/test.html", locals: { index: index, status: :fail }
  proxy "/tests/#{index}_pass.html", "sample/test.html", locals: { index: index, status: :pass }
end

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
