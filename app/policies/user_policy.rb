class UserPolicy < ApplicationPolicy
      def edit_user?
        update_user?
      end
      
      def update_user?
        user.role?
      end
      
      def delete_user?
        user.role?
      end

      def new_user?
       create_user?
      end
      
      def create_user?
        user.role?
      end
      
   class Scope < Scope
      def resolve
         if user.role?           #If is it an administrator...
            scope.all
         end
      end
      
   end
end