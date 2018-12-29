class ChallengePolicy < ApplicationPolicy
    attr_reader :user, :challenge

    def initialize(user, challenge)
        @user = user || User.new
        @challenge = challenge
    end

    def create?
        user.role == 'admin'
    end

    def edit?
        user.role == 'admin'
    end
    def update?
        user.role == 'admin'
    end

    def destroy?
        user.role == 'admin'
    end

end