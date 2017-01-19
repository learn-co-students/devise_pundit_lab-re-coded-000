class NotePolicy < ApplicationPolicy
     attr_reader :note
 
     def initialize(user, note)
       super(user, note)
       @note = record
     end
 
     def show?
         has_permition?  || user.moderator? ||is_viewer? 

     end
     def update?
         has_permition? 

     end
     def edit?
         has_permition? 
     end
     def destroy?
     	has_permition?
     end
     def create?
     	has_permition?
     end
     private
      def has_permition?
         note.try(:user) == user || user.admin? 
      end
      def is_viewer?
         note.readers.detect{|u|u==user} !=nil ? true : false

      end
   end
