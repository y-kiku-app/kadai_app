class AdminUserDashboardsController < ApplicationController
    layout 'admin_user_dashboards/layout/application'
    before_action :authenticate_admin_user!

end
