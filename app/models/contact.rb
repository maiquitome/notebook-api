class Contact < ApplicationRecord
  belongs_to :kind

  def author
    "Maiqui Tomé"
  end

  # definindo padrão pra todos (redefenindo o método)
  def as_json(options = {})
    # o super invoca o as_json original
    super(methods: :author, root: true)
  end
end
