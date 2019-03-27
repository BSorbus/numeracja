//document.addEventListener('turbolinks:load', function() {
$(document).ready(function() {

  $.fn.dataTable.ext.buttons.nspc_tables_export_csv = {
    text: '<span class="fa fa-file-csv"></span>',
    titleAttr: 'Export CSV',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#nspc_tables-datatable').data('export_csv_url');
    }  
  };

  $.fn.dataTable.ext.buttons.nspc_tables_export_xml = {
    text: '<span class="fa fa-file-code"></span>',
    titleAttr: 'Export XML',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#nspc_tables-datatable').data('export_xml_url');
    }  
  };


  var oClubsTable = $('#nspc_tables-datatable').DataTable({
    dom: 'lBfrtip',
    buttons: [
      'nspc_tables_export_csv',
      'nspc_tables_export_xml',
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
      url: $('#nspc_tables-datatable').data('source'),
      type: "GET",
      data: function(d){
        //d.eager_filter_for_current_user = $('#nspc_tables-datatable').DataTable().button(3).active();
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
      { "data": "zone" }, 
      { "data": "number" }, 
      { "data": "operator" },
      { "data": "operator_name" },
      { "data": "modification" }
    ],
    order: [[ 1, "asc" ]],
    language: {
      //url: $('#nspc_tables-datatable').data('locale') "<%= Rails.application.routes.url_helpers.datatables_lang_path(locale: I18n.locale, format: :json) %>"
      url: $('#nspc_tables-datatable').data('locale_url')
    }
  });
 

});