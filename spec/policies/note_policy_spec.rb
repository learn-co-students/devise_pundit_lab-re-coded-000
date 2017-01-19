require "pundit/rspec"

describe NotePolicy do
  subject { NotePolicy }

describe NotePolicy do
  subject { NotePolicy }
  current_user=User.new(name:"Ali")
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }
  moderator=User.new(name: "colin")
  moderator.role="moderator"
  note=Note.new(content: "test")
  note.user=current_user
  alice=User.new(name: "alice")
  note.readers << alice

  permissions :show? do
    it "prevents other users from seeing your notes" do
      expect(subject).not_to permit(User.new(name: "Jack"),note )
    end

    it "allows you to see your own notes" do
      expect(subject).to permit(current_user, note)
    end
    it "allows an admin to see any notes" do
      expect(subject).to permit(admin, note)
    end
    it "allows a moderator to see any notes" do
      expect(subject).to permit(moderator, note)
    end
    it "allows users to see notes they're viewers of" do
      expect(subject).to permit(alice, note)
    end
  end
    permissions :update? do
    it "prevents other users from editing your notes" do
      expect(subject).not_to permit(User.new(name: "Jack"),note )
    end

    it "allows you to edit your own notes" do
      expect(subject).to permit(current_user, note)
    end
    it "allows an admin to edit any notes" do
      expect(subject).to permit(admin, note)
    end

  end
  permissions :destroy? do
    it "prevents other users from deleting your notes" do
      expect(subject).not_to permit(User.new(name: "Jack"),note )
    end

    it "allows you to delete your own notes" do
      expect(subject).to permit(current_user, note)
    end

    it "allows an admin to delete any notes" do
      expect(subject).to permit(admin, note)
    end
  end
 permissions :create? do


    it "allows you to create your notes" do
      expect(subject).to permit(current_user, note)
    end

    it "allows an admin to create any notes" do
      expect(subject).to permit(admin, note)
    end
  end
end
end