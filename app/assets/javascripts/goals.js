$(document).ready(function(){
    $('#goals-table').DataTable({
        // searching: false,
        paging: false,
        // columnDefs: [
        //     { targets: 'nosort', orderable: false}
        // ],
        responsive: true,
        order: [2, 'desc'],
        // pageLength: -1,
        // lengthMenu: [ [10, 20, 30, 50, -1], [10, 20, 30, 50, "All"] ],
        language: { lengthMenu: "Display _MENU_ Goals" },
        columnDefs: [
          {
            targets: [ 0 ],
            visible: false
          }
        ]
    });
});
