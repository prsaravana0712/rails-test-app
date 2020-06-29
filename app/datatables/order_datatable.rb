class OrderDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      order_id: { source: "Order.order_id" },
      item_name: { source: "Order.item_name" },
      price: { source: "Order.price" },
      customer_name: { source: "Order.customer_id" }
    }
  end

  def data
    records.map do |record|
      {
        order_id: record.order_id,
        item_name: record.item_name,
        price: record.price,
        customer_name: record.customer_id,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Order.all
  end
end