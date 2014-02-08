
class UsersController < Devise::RegistrationsController

    def new
        super
    end

    def update
        super
    end

    def show
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

