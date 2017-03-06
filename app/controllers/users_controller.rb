class UsersController < ApplicationController

  
  def index
    @users=User.all
  end

  def show

      @user=User.find(params[:id])
      authorize @user
  end

    def destroy
      @user=User.find(params[:id])
      authorize @user
    end
    def edit
      @user=User.find(params[:id])
    end
    def update
      @user=User.find(params[:id])
        @user.update(set_psrams)
        authorize @user
    end
    private
      def note_params
        params.require(:user).permit(:name)
      end
end