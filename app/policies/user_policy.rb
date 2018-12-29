class UserPolicy < ApplicationPolicy
    attr_reader :user

    def edit?
        if user.present?
            user.role == 'admin' || record.id == user.id
        end
    end

    def update?
        user.role == 'admin' or record.id == user.id
    end

end