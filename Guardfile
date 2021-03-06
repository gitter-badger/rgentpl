notification :growl

# Spork
guard 'spork',
  rspec_env: { 'RAILS_ENV' => 'test' } do
  watch('config/environment.rb')
  watch('config/boot.rb')
  watch(%r{^config/environments/.+\.rb$})
  watch(%r{^config/initializers/.+\.rb$})
  watch(%r{^lib/.+\.rb$})
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
end

# Bundler
guard :bundler do
  watch('Gemfile')
end

# Cane
guard :cane do
  watch(%r{^(.+)\.rb$})
end

# Flog
guard :flog do
  watch(%r{^lib/.+\.rb$})
end

# Rubocop
guard :rubocop,
  all_on_start: false,
  cli: ['--format', 'clang', '--rails'],
  notification: true do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

# Yard
guard 'yard' do
  watch(%r{lib/.+\.rb})
  watch(%r{vendor/.+\.rb})
end

# Rspec
guard :rspec,
  cmd:              'rspec --color --format doc --fail-fast --drb',
  all_on_start:     false,
  notification:     true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})      { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end
