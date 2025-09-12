class UsersController < ApplicationController
        def show
                # byebug
                @user=User.find(params[:id])
                @articles=@user.articles
        end
        def new
        @user=User.new
        end
        def create 
                # byebug
                @user=User.new(user_params)
                if @user.save
                        flash[:notice]="Welcome to the blog #{@user.username}, you have sucessfully signed up"
                        redirect_to articles_path
                else
                        render :new,status: :unprocessable_entity
                end
        end
        def edit
                # byebug
                @user=User.find(params[:id])
        end

        def update
                # byebug
                @user=User.find(params[:id])
                if@user.update(user_params)
                        flash[:notice]="User Profile has been updated"
                        redirect_to articles_path
                        @user.save
                else
                        render :edit ,status: :unprocessable_entity 
                end
        end




        private
        def user_params
                params.require(:user).permit(:username,:email,:password)
        end
end