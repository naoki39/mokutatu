class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])#アイコンでクリックされたユーザーのレコードが格納されている
    @posts = @user.posts#クリックされたユーザーの投稿一覧が格納されている
  end
end
