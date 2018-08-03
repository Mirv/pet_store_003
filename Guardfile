guard :minitest do
  # with Minitest::Unit

  #  Watching all sub folder's tests for minitest using the _test
  watch(%r"^test/.*/*_test.rb$")

  #  Watching app's controllers/models/policies
  watch(%r"^app/models/(.*)\.rb$") { |m| "test/models/#{m[1]}_test.rb" }
  watch(%r"^app/policies/(.*)\.rb$") { |m| "test/policies/#{m[1]}_test.rb" }
  watch(%r"^app/controllers/(.*)\.rb$") { |m| "test/controllers/#{m[1]}_test.rb" }

  #  Watch the tests themselves for TDD writing of tests
  watch(%r{^test/policies/*\.rb})
  watch(%r{^test/models/*\.rb}) 
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  #  Guard's suggested testing helpers
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/lib/#{m[1]}_test.rb" }
  watch(%r{^test/.+_test\.rb$})
  watch(%r{^test/test_helper\.rb$}) { 'test' }
end
