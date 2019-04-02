//document.addEventListener('turbolinks:load', function() {
$(document).ready(function() {

  function ndsTableFilterColumnParams ( i ) {
    $('#nds_tables-datatable').DataTable().column( i ).search(
      $('#col'+i+'filter').val(), false, true, true
    );
    $('#nds_tables-datatable').DataTable().draw();
  };

  $.fn.dataTable.ext.buttons.nds_tables_button_filter_show_hide = {
    //text: 'Filtr',
    text: '<span class="fa fa-eye-slash"></span>',
    titleAttr: 'Filtr',
    action: function ( e, dt, node, config ) {
      if ($('#nds_tables-datatable').DataTable().tables().footer().to$().css('display') === 'none') {
        $('#nds_tables-datatable').DataTable().tables().footer().to$().css('display', 'table-row-group');
        //dt.button( 4 ).text('Filtrowanie...');
        dt.button( 3 ).text('<span class="fa fa-eye"></span>');
        dt.button( 3 ).active( true );
        // Redraw table (and reset main search filter)
        $($.fn.dataTable.tables(true)).DataTable().search("").draw();
        $(".dataTables_filter").hide();
      } else {
        $('#nds_tables-datatable').DataTable().tables().footer().to$().css('display', 'none');
        //dt.button( 4 ).text('Filtr');
        dt.button( 3 ).text('<span class="fa fa-eye-slash"></span>');
        dt.button( 3 ).active( false );
        // Reset Column filtering
        $('#nds_tables-datatable tfoot input').val('').keyup();

        $(".dataTables_filter").show();
      }

      $($.fn.dataTable.tables(true)).DataTable()
        .columns.adjust()
        .responsive.recalc();
    }
  };

  $.fn.dataTable.ext.buttons.nds_tables_export_csv = {
    text: '<span class="fa fa-file-csv"></span>',
    titleAttr: 'Export CSV',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#nds_tables-datatable').data('export_csv_url');
    }  
  };

  $.fn.dataTable.ext.buttons.nds_tables_export_xml = {
    text: '<span class="fa fa-file-code"></span>',
    titleAttr: 'Export XML',
    className: 'btn btn-default',
    action: function ( e, dt, button, config ) {
      window.location = $('#nds_tables-datatable').data('export_xml_url');
    }  
  };


  var oNdsTable = $('#nds_tables-datatable').DataTable({
    dom: 'lBfrtip',
    buttons: [
      'nds_tables_export_csv',
      'nds_tables_export_xml',
      {
        extend:    'colvis',
        text:      '<span class="fa fa-columns"></span>',
        titleAttr: 'Columns show/hide',
        columns:   ':gt(0)' //exclude first col from list
      }, 
      'nds_tables_button_filter_show_hide'
    ],
    responsive: true,
    processing: true,
    serverSide: true,
    deferRender: true,
    searchDelay: 500,
    ajax: { 
      url: $('#nds_tables-datatable').data('source'),
      type: "GET",
      data: function(d){
        //d.eager_filter_for_current_user = $('#nds_tables-datatable').DataTable().button(3).active();
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
      { "data": "modification" }
    ],
    order: [[ 1, "asc" ]],
    language: {
      //url: $('#nds_tables-datatable').data('locale') "<%= Rails.application.routes.url_helpers.datatables_lang_path(locale: I18n.locale, format: :json) %>"
      url: $('#nds_tables-datatable').data('locale_url')
    }
  });
 

  $('input.column_filter').on( 'keyup click', function () {
    ndsTableFilterColumnParams( $(this).attr('data-column') );
  });

  $('select.column_filter').on( 'keyup click', function () {
    ndsTableFilterColumnParams( $(this).attr('data-column') );
  });

});