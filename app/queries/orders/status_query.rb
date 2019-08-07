module Orders
  class StatusQuery
    def initialize(user, status = nil)
      @user = user
      @status = status
    end

    def call
      if status_exist?
        @user.orders.where(status: @status)
      else
        @user.orders.where(status: :in_progress)
      end
    end

    private

    def status_exist?
      return false if @status.nil?

      Order::FINISH_STATUSES.include?(@status.to_sym)
    end
  end
end
