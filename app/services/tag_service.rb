class TagService
  def initialize(params)
    @input_tags = params
    @validator = Tag
      .validators
      .find { |validator| validator.instance_of? ActiveModel::Validations::FormatValidator }
      .options[:with]
  end

  def tags
    input_tags
      .split(" ")
      .uniq
      .select { |raw_tag| raw_tag =~ validator }
      .map { |raw_tag| Tag.find_or_create_by(name: raw_tag) }
  end

  private

  attr_reader :input_tags, :validator
end
