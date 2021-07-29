
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new 
   
   if user.id ==1
    can :manage, :all

    else
   
      can :index, CurrentAccount, :id => user.id
      
      # Crear Nuevo Usuario
      can :create, User
      # Ver / Actualizar SOLO SUS DATOS
      can :read, User, :id => user.id
      can :update, User, :id => user.id
    end

  end
end


#class Ability
#  include CanCan::Ability

#  def initialize(user)
#    user ||= User.new # guest user (not logged in

#    if user.present?  # additional permissions for logged in users (they can read their own posts)
#      can :index, CurrentAccount, user_id: user.id
#      can :create, User
#      # Ver / Actualizar SOLO SUS DATOS
#      can :read, User, :id => user.id
#      can :update, User, :id => user.id

#      if user.id == 1  # additional permissions for administrators
#        can :manage, :all
#      end
#    end
#  end
#end
