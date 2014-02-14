class UsersController < ApplicationController
  before_filter :check_auth, :except => [:index]
  respond_to :json, :xml, :html #, :except => :login

  def login
    if current_user
      respond_with User.select(:id,:first_name,:last_name,:avatar_name,:level,:coins,:battles_won,:battles_lost,:battles_tied,:experience_points,:available,:online,:gaming,:email,:avatar_image).find(current_user.id)
    else
      render json: '"not authorized"'  # Probably never called as the server will reject bad passwords, etc.
    end
  end
  
  def index
    @users = User.order( :available ).select( :id, :avatar_name, :level, :battles_won, :battles_lost, :battles_tied, :available, :online, :gaming, :avatar_image )
    @users = User.is_available? if params[:available]
    respond_with @users
  end
  
  def challenge
    @user = current_user
    @challenged = User.find_by_id( params[:challenge] )
    attackboard_1 = Board.create(width:10, height:10)
    attackboard_2 = Board.create(width:10, height:10)
    defendboard_1 = Board.create(width:10, height:10)
    defendboard_2 = Board.create(width:10, height:10)
    @game = Game.new( player_id_1:@user.id, player_id_2:@challenged.id,
        attack_board_id_1:attackboard_1.id,
        attack_board_id_2:attackboard_2.id,
        defend_board_id_1:defendboard_1.id,
        defend_board_id_2:defendboard_2.id,
        coins: 100      # TODO:  Assign coins to different types of games.
                        # TODO:  Apportion out based on relative damage to each side
    )
  end
  
end
