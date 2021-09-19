require "rails_helper"

RSpec.describe "Coupons actions", type: :request do
   describe "index" do 
      before do
          Coupon.create(code: "ABC", times_used: "0")
          Coupon.create(code: "ABCD", times_used: "1")
      end
   
      it "shows all coupons" do
          get "/coupons"
          expect(response).to be_successful
          expect(response.body).to include("Last Updated:")
      end
    end
end