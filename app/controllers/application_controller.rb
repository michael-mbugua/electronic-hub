class ApplicationController < Sinatra::Base
    set :default_content_type, "application/json"
    before do
        response.headers["Access-Control-Allow-Origin"]="*"
    end

    options "*" do
        response.headers["Access-Control-Allow-Methods"]="GET,POST,PUT,PATCH,DELETE,OPTIONS"
    end
# BUYERS END-POINTS 
        get "/buyers" do
            Buyer.all.to_json
        end
        get "/sellers" do
            Seller.all.to_json
        end
        post "/buyers" do
            buyers=Buyer.create(
                name: params[:name],
                email: params[:email],
                password: params[:password]
            )
            buyers.to_json
        end
        delete "/buyers/:id" do
            buyers = Buyer.find(params[:id])
            buyers.destroy
            {message: "Buyer '#{buyers.name}' has been deleted."}.to_json
        end

# SELLER'S END-POINTS
        post "/sellers" do
            sellers=Seller.create(
                name: params[:name],
                email: params[:email],
                password: params[:password]
            )
            sellers.to_json
        end
        delete "/sellers/:id" do
            sellers=Seller.find(params[:id])
            sellers.destroy
            {message: "seller '#{sellers.name}' has been deleted."}.to_json
        end 
    
# PRODUCTS END-POINTS
        get "/products" do
            Product.all.to_json
        end
        post "/products" do
            products=Product.create(
                name: params[:name],
                category: params[:category],
                price: params[:price],
                description: params[:description]
            )
            products.to_json
        end
        delete "/products/:id" do
            Product.find(params[:id]).destroy
        end
# ORDERS ENDPOINTS
        get "/orders" do
            Order.all.to_json
        end
        post "/orders" do
            Order.create(
                buyer_id: params[:buyer_id],
                product_id: params[:product_id],
                total: params[:total]
            ).to_json
        end
        delete "/orders/:id" do
            Order.find(params[:id]).destroy
        end
        
end