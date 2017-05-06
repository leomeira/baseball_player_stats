$(document).ready(function(){   
  $('#stats-table').DataTable( {
    autoWidth: true,
    order: [[2, 'desc']],
    ordering: true,
    pageLength: 25,
    paging: true,
    serverSide: true,
    ajax: {
      url: 'stats.json',
      contentType: 'application/json',
      type: 'GET'
    }
  });
});
