//document.addEventListener('turbolinks:load', function() {
$(document).ready(function() {

  $.fn.dataTable.ext.buttons.pstn_tables_export_csv = {
    text: '<span class="fa fa-download"></span>',
    titleAttr: 'Export',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#pstn_tables-datatable').data('export_csv_url');
    }  
  };

  var oClubsTable = $('#pstn_tables-datatable').DataTable({
    dom: 'lBfrtip',
    buttons: [
      'pstn_tables_export_csv', 
      {
        extend:    'colvis',
        text:      '<span class="fa fa-columns"></span>',
        titleAttr: 'Columns show/hide',
        columns:   ':gt(0)' //exclude first col from list
      }
    ],
    responsive: true,
    processing: true,
    serverSide: true,
    deferRender: true,
    searchDelay: 500,
    ajax: { 
      url: $('#pstn_tables-datatable').data('source'),
      type: "GET",
      data: function(d){
        //d.eager_filter_for_current_user = $('#pstn_tables-datatable').DataTable().button(3).active();
      },
      error: function (jqXHR, exception) {
        console.log(jqXHR);
        if (jqXHR.status == 401) {
          window.location.reload();
        } else {
          getErrorMessage(jqXHR, exception);
        }
      }
    },
    pagingType: "full_numbers",
    lengthMenu: [[10, 15, 25, 50, 100], [10, 15, 25, 50, 100]],
    columns: [
      { "data": "id",
        "visible": false }, 
      { "data": "scope" }, 
      { "data": "operator" },
      { "data": "operator_name" },
      { "data": "zone" }, 
      { "data": "zone_name" }, 
      { "data": "zone_symbol" }, 
      { "data": "numbering_area" }, 
      { "data": "change_date" }
    ],
    order: [[ 1, "asc" ]],
    language: {
      //url: $('#pstn_tables-datatable').data('locale') "<%= Rails.application.routes.url_helpers.datatables_lang_path(locale: I18n.locale, format: :json) %>"
      url: $('#pstn_tables-datatable').data('locale_url')
    }
  });
 

});