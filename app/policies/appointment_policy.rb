class AppointmentPolicy < ApplicationPolicy
      def edit?
        update?
      end
      
      def update?
        user.role?
      end
      
      def remove?
        user.role?
      end
      

      def new?
       create?
      end
      
      def create?
        user.role?
      end
      
      def destroy?
        user.role?
      end
      
   class Scope < Scope
      def resolve
         if user.role?           #If is it an administrator...
            scope.all
         else
            scope.where(user_id: user.id)
         end
      end
      
      def show?
         scope.where(id => resource.id).exists? && scope.find(id).user_id == user.id
      end
      
   end
end