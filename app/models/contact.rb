class Contact < ApplicationRecord
  belongs_to :kind
  # belongs_to :kind, optional: true

  def author
    "Maiqui Tomé"
  end

  def kind_description
    self.kind.description
  end

  # definindo padrão pra todos (redefenindo o método)
  def as_json(options = {})
    # o super invoca o as_json original
    super(
      root: true,
      methods: [:kind_description, :author],

      # methods: :author,
      # include: :kind
      # include: { kind: {only: :description} }
    )
  end
end
