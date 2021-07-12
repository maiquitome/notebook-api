class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :update, :destroy]

  # GET /contacts
  def index
    @contacts = Contact.all


    # ADICIONANDO NOVOS CONTATOS (quando tiver uma coleção):
    # render json: @contacts.map { |contact| contact.attributes.merge({ author: "Maiqui" }) }

    # QUANDO TIVER SÓ UM CONTATO:
    # render json: @contacts.attributes.merge({ author: "Maiqui" })

    # USANDO O METHODS:
    # render json: @contacts, methods: :author



    # SEM ROOT:

    render json: @contacts

    # [{
    #   "id": 1,
    #   "name": "Jarrett Upton",
    #   "email": "milton@kutch.net",
    #   "birthdate": "1991-09-07",
    #   "created_at": "2021-07-11T23:21:13.663Z",
    #   "updated_at": "2021-07-11T23:21:13.663Z",
    #   "kind_id": 1
    # }]



    # COM ROOT:

    # render json: @contacts, root: true

    # [{
    #   "contact": {
    #     "id": 1,
    #     "name": "Jarrett Upton",
    #     "email": "milton@kutch.net",
    #     "birthdate": "1991-09-07",
    #     "created_at": "2021-07-11T23:21:13.663Z",
    #     "updated_at": "2021-07-11T23:21:13.663Z",
    #     "kind_id": 1
    #   }
    # }]
  end

  # GET /contacts/1
  def show
    render json: @contact
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created, location: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:name, :email, :birthdate, :kind_id)
    end
end
