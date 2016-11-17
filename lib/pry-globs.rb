require_relative 'pry-globs/globs'

Pry::Commands.create_command "globs" do
  description "Global variables, documented."

  def process
    output.puts Globs.new(args).get_identifier_description
  end
end
