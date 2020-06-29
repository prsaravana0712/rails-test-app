$.extend($.fn.dataTable.defaults, {
  responsive: true,
  pagingType: 'full'
});

$(document).on('preInit.dt', function (e, settings) {
  let api = new $.fn.dataTable.Api(settings);
  let table_id = "#" + api.table().node().id;
  let url = $(table_id).data('source');

  if (url) {
    return api.ajax.url(url);
  }
});

$(document).on('turbolinks:load', function () {
  if (!$.fn.DataTable.isDataTable("table[id^=dttb-]")) {
    $("table[id^=dttb-]").DataTable();
  }
});

$(document).on('turbolinks:before-cache', function () {
  let dataTable = $($.fn.dataTable.tables(true)).DataTable();

  if (dataTable !== null) {
    dataTable.clear();
    dataTable.destroy();

    return dataTable = null;
  }
});