class Ability
  include CanCan::Ability

  def initialize(user)

    # can :buy, Team do |team|
    #   # user.available_credit < team.current_value || team.stocks_available < 1 || user_stock_quantity(user).first.to_i >= 20 || team.closest_match_date <= DateTime.now && team.end_match_date >= DateTime.now
    # end

    # if user.has_role? :admin
    #   can :access, :all
    # else
    #   can :read, :all
    # end

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
