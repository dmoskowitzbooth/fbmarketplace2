class ItemsController < ApplicationController
  def index
    if current_user.latitude.present? && current_user.longitude.present?
      matching_items = Item.near([current_user.latitude, current_user.longitude], 50)
    else
      matching_items = Item.all
    end

    @list_of_items = matching_items.order(created_at: :desc)

    render template: "items/index"
  end


  def show
    the_id = params.fetch("path_id")

    matching_items = Item.where({ :id => the_id })

    @the_item = matching_items.at(0)

    render({ :template => "items/show" })
  end

  def create
    the_item = Item.new
    the_item.name = params.fetch("query_name")
    the_item.description = params.fetch("query_description")
    the_item.category = params.fetch("query_category")
    the_item.image = params.fetch("query_image")
    the_item.seller_id = params.fetch("query_seller_id")
    the_item.asking_price = params.fetch("query_asking_price")
    the_item.og_purchase_price = params.fetch("query_og_purchase_price")
    the_item.address = params.fetch("query_address")
    the_item.status = params.fetch("query_status")
    the_item.sale_type = params.fetch("query_sale_type")
    the_item.offers_count = params.fetch("query_offers_count")
    the_item.msg_chains_count = params.fetch("query_msg_chains_count")
    the_item.reviews_count = params.fetch("query_reviews_count")

    if the_item.valid?
      the_item.save
      redirect_to("/items", { :notice => "Item created successfully." })
    else
      redirect_to("/items", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.name = params.fetch("query_name")
    the_item.description = params.fetch("query_description")
    the_item.category = params.fetch("query_category")
    the_item.image = params.fetch("query_image")
    the_item.seller_id = params.fetch("query_seller_id")
    the_item.asking_price = params.fetch("query_asking_price")
    the_item.og_purchase_price = params.fetch("query_og_purchase_price")
    the_item.address = params.fetch("query_address")
    the_item.status = params.fetch("query_status")
    the_item.sale_type = params.fetch("query_sale_type")
    the_item.offers_count = params.fetch("query_offers_count")
    the_item.msg_chains_count = params.fetch("query_msg_chains_count")
    the_item.reviews_count = params.fetch("query_reviews_count")

    if the_item.valid?
      the_item.save
      redirect_to("/items/#{the_item.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/items/#{the_item.id}", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully."} )
  end
  def new
  @item = current_user.selling_items.build
  end
end
