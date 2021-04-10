json.extract! coupon, :id, :code, :used, :created_at, :updated_at
json.url coupon_url(coupon, format: :json)
