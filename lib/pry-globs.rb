require_relative 'pry-globs/globs'

Pry::Commands.create_command "globs" do
  description "Global variables, documented."

  def process
    if args.size > 1
      raise Pry::CommandError, "You can pass only one global variable identifier."
    end

    output.puts Globs.find(args.first)
  end
end
