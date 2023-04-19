module AccountActivationsHelper
    def change
        add_column :users, :activation_digest, :string
        add_column, :users, :acivated, :boolean,
end
