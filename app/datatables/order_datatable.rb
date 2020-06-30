class OrderDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      order_id: { source: "Order.order_id" },
      item_name: { source: "Order.item_name" },
      price: { source: "Order.price" },
      customer_name: { source: "Order.customer_name", searchable: false }
    }
  end

  def data
    records.map do |record|
      {
        order_id: record.order_id,
        item_name: record.item_name,
        price: record.price,
        customer_name: record.customer_name,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Order.joins("INNER JOIN customers on customers.id =  orders.customer_id").select("orders.id as id, orders.order_id as order_id, orders.item_name as item_name, orders.price as price, customers.name as customer_name")
  end
end