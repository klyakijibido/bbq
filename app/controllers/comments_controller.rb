class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    @new_comment = @event.comments.build(comment_params)
    @new_comment.user = current_user

    if @new_comment.save
      redirect_to @event, notice: I18n.t('controllers.comment.created')
    else
      render 'events/show', alert: I18n.t('controllers.comment.error')
    end
  end

  # DELETE /comments/1
  def destroy
    message = {notice: I18n.t('controllers.comment.destroyed')}

    if current_user_can_edit?(@comment)
      @comment.destroy
    else
      message = {alert: I18n.t('controllers.comment.error')}
    end

    redirect_to @event, message
  end

  private
    def set_event
      @event = Event.find(params[:event_id])
    end

    def set_comment
      @comment = @event.comments.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:body, :user_name)
    end
end
