class SettingController < ApplicationController
  before_action :set_setting

  def show
  end

  def edit
  end

  def update
    if @setting.update_attributes(setting_params)
      redirect_to setting_path
    else
      render :edit
    end
  end


  private

  def set_setting
    @setting = Setting.first || Setting.create
  end

  def setting_params
    params.require(:setting).permit(:name, :oauth_id, :oauth_secret)
  end
end
