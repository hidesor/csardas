class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    # 加入 strong_parameters 與 devise 整合的 hack
    before_action :configure_permitted_parameters, if: :devise_controller?

        protected

    def configure_permitted_parameters
        # devise_parameter_sanitizer.for(:sign_up) do |u|
        #    u.permit(:name, :email, :password, :password_confirmation)
        # end
        devise_parameter_sanitizer.for(:sign_up) do |u|
            u.permit(:name, :email, :password, :password_confirmation)
        end

        devise_parameter_sanitizer.for(:account_update) do |u|
            u.permit(:name, :email, :password, :password_confirmation, :current_password)
        end
    end

    def admin_required
        redirect_to '/' unless current_user.admin?
    end

    helper_method :current_cart

    def current_cart
        @current_cart ||= find_cart
    end

    private

    def find_cart
        cart = Cart.find_by(id: session[:cart_id])

        cart = Cart.create unless cart.present?

        session[:cart_id] = cart.id
        cart
    end
end
