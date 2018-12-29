class ChallengePolicy < ApplicationPolicy
    attr_reader :user, :challenge

    def initialize(user, challenge)
        @user = user
        @challenge = challenge
    end

    def create?
        user.role == 'admin'
    end

    def update?
        user.role == 'admin'
    end

    def destroy?
        user.role == 'admin'
    end

end