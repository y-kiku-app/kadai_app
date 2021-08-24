# frozen_string_literal: true

class MypageController < ApplicationController
  before_action :authenticate_user!, except: [:logout]

  def show; end

  def logout; end
end
