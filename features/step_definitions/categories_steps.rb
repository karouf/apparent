Given /^there is the following (.+) records$/ do |factory, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|  
    Factory(factory, hash)  
  end
end