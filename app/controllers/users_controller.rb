
class UsersController < Devise::RegistrationsController

    def index
        super
    end

    def create
        super
    end

    # sign_up
    def new
        super
    end

    def edit 
        super
    end

    def show 
        super
    end

    def update
        super
    end

    def destroy
        super
    end

    # Return:
    #   [{"id":8,"name":"Miss Piggy"},{"id":9,"name":"Miss Poogy"}]
    def get_clients
        role_client = Role.find_by name: 'cliente'
        render :json => 
            User.select(:id, :name)
                .where(role_id: role_client.id)
                .sort
                .to_json
    end

end

