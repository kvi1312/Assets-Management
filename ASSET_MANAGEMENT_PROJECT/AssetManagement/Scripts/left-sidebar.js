/** add active class and stay opened when selected */
var url = window.location;

// for sidebar menu entirely but not cover treeview
$('ul.sidebar-menu a').filter(function () {
    return this.href == url;
    console.log(url);
}).parent().addClass('active');
