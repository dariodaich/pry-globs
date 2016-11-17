class IdentifierTable
  attr_reader :data

  def initialize
    @data = load_identifier_table
  end

  private

  def load_identifier_table
    YAML.load_file(identifier_data_file_path)
  end

  def identifier_data_file_path
    File.expand_path("../../support/identifier_data.yaml", __FILE__)
  end
end
