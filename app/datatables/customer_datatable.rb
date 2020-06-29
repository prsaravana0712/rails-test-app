class CustomerDatatable < AjaxDatatablesRails::ActiveRecord
  def view_columns
    @view_columns ||= {
      name: { source: "Customer.name" },
      email: { source: "Customer.email" },
      mobile: { source: "Customer.mobile" },
      city: { source: "Customer.city" }
    }
  end

  def data
    records.map do |record|
      {
        name: record.name,
        email: record.email,
        mobile: record.mobile,
        city: record.city,
        DT_RowId: record.id
      }
    end
  end

  def get_raw_records
    Customer.all
  end
end