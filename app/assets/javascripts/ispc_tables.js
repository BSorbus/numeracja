//document.addEventListener('turbolinks:load', function() {
$(document).ready(function() {

  function ispcTableFilterColumnParams ( i ) {
    $('#ispc_tables-datatable').DataTable().column( i ).search(
      $('#col'+i+'filter').val(), false, true, true
    );
    $('#ispc_tables-datatable').DataTable().draw();
  };

  $.fn.dataTable.ext.buttons.ispc_tables_button_filter_show_hide = {
    //text: 'Filtr',
    text: '<span class="fa fa-eye-slash"></span>',
    titleAttr: 'Filtr',
    action: function ( e, dt, node, config ) {
      if ($('#ispc_tables-datatable').DataTable().tables().footer().to$().css('display') === 'none') {
        $('#ispc_tables-datatable').DataTable().tables().footer().to$().css('display', 'table-row-group');
        //dt.button( 4 ).text('Filtrowanie...');
        dt.button( 3 ).text('<span class="fa fa-eye"></span>');
        dt.button( 3 ).active( true );
      } else {
        $('#ispc_tables-datatable').DataTable().tables().footer().to$().css('display', 'none');
        //dt.button( 4 ).text('Filtr');
        dt.button( 3 ).text('<span class="fa fa-eye-slash"></span>');
        dt.button( 3 ).active( false );
      }

      $($.fn.dataTable.tables(true)).DataTable()
        .columns.adjust()
        .responsive.recalc();
    }
  };

  $.fn.dataTable.ext.buttons.ispc_tables_export_csv = {
    text: '<span class="fa fa-file-csv"></span>',
    titleAttr: 'Export CSV',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#ispc_tables-datatable').data('export_csv_url');
    }  
  };

  $.fn.dataTable.ext.buttons.ispc_tables_export_xml = {
    text: '<span class="fa fa-file-code"></span>',
    titleAttr: 'Export XML',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#ispc_tables-datatable').data('export_xml_url');
    }  
  };


  var oIspcTable = $('#ispc_tables-datatable').DataTable({
    dom: 'lBfrtip',
    buttons: [
      'ispc_tables_export_csv', 
      'ispc_tables_export_xml',
      {
        extend:    'colvis',
        text:      '<span class="fa fa-columns"></span>',
        titleAttr: 'Columns show/hide',
        columns:   ':gt(0)' //exclude first col from list
      }, 
      'ispc_tables_button_filter_show_hide'
    ],
    responsive: true,
    processing: true,
    serverSide: true,
    deferRender: true,
    searchDelay: 500,
    ajax: { 
      url: $('#ispc_tables-datatable').data('source'),
      type: "GET",
      data: function(d){
        //d.eager_filter_for_current_user = $('#ispc_tables-datatable').DataTable().button(3).active();
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
      { "data": "id", "visible": false }, 
      { "data": "number" }, 
      { "data": "provider_id" },
      { "data": "provider_name" },
      { "data": "location" },
      { "data": "modification" }
    ],
    order: [[ 1, "asc" ]],
    language: {
      //url: $('#ispc_tables-datatable').data('locale') "<%= Rails.application.routes.url_helpers.datatables_lang_path(locale: I18n.locale, format: :json) %>"
      url: $('#ispc_tables-datatable').data('locale_url')
    }
  });
 

  $('input.column_filter').on( 'keyup click', function () {
    ispcTableFilterColumnParams( $(this).attr('data-column') );
  });

  $('select.column_filter').on( 'keyup click', function () {
    ispcTableFilterColumnParams( $(this).attr('data-column') );
  });

});