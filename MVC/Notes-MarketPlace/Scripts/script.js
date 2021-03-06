/* =====================================================
                  Search Note Functions
===================================================== */

$(() => {
    getNotes();

    $('#search-input-note').on('keyup', () => {
        getNotes();
    });
    $('.search-filter').on('click', () => {
        getNotes();
    });
});

function getNotes(target) {

    $.ajax({
        url: '/Home/FilterNote',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input-note').val(),
            type: $('#searchFilter_type').val(),
            category: $('#searchFilter_category').val(),
            univarsity: $('#searchFilter_univarsity').val(),
            course: $('#searchFilter_course').val(),
            country: $('#searchFilter_country').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getNoteList').html('').html(res);
        }
    });
}

/* =====================================================
                  Buyer Request Functions
===================================================== */

$(() => {
    getRequest();
});

function getRequest(target) {

    $.ajax({
        url: '/Transaction/BuyerRequestPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getBuyerRequest').html('').html(res);
        }
    });
}

/* =====================================================
        Sell Note Published Notes Functions
===================================================== */

$(() => {
    getSellNotePublished();
});

function getSellNotePublished(target) {

    $.ajax({
        url: '/Home/SellNotePublishedNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input1').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSellPublishedNotes').html('').html(res);
        }
    });
}

/* =====================================================
        Sell Note In Progress Notes Functions
===================================================== */

$(() => {
    getSellNoteInProgress();
});

function getSellNoteInProgress(target) {

    $.ajax({
        url: '/Home/SellNoteInProgressNotesPartial',
        dataType: 'html',
        method: 'GET',
        data: {
            search: $('#search-input').val(),
            pageNumber: parseInt(target),
        },
        success: function (res) {
            $('#getSellInProgressNotes').html('').html(res);
        }
    });
}

/* =====================================================
                    Mobile Menu
===================================================== */

$(function () {
    
    $("#menu-icon").click(function(){
        $("#mobile-menu-page").show();
    });    
    
    $("#mobile-close").click(function(){
        $("#mobile-menu-page").hide();
    });
    
    $(".sub-menu").click(function () {
        var target = $(this).attr("target");
        $(target).toggle();
    });
});

/* =====================================================
                    Password Show
===================================================== */

$(function () {

    $(".show-pass").on("click", function () {

        //        $(this).find('[data-fa-i2svg]').toggleClass('fa-eye fa-eye-slash');
        var currentState = $(this).attr("target");

        if ($(currentState).attr('type') == "password") {
            $(currentState).attr('type', "text");
        } else {
            $(currentState).attr('type', "password");
        }
    });
});

/* =====================================================
                        Header
===================================================== */

function sticky_header() {
    var header_height = jQuery('.site-header').innerHeight() / 2;
    var scrollTop = jQuery(window).scrollTop();
    var a = $("section").attr("id");
    if (a == "home") {
        if (scrollTop > header_height) {
            jQuery('body').addClass('sticky-header');
            jQuery('.logo-wrapper img').attr('src', "/Images/logo.png");
        } else {
            jQuery('body').removeClass('sticky-header');
            jQuery('.logo-wrapper img').attr('src', "/Images/top-logo.png");
        }
    }
}

jQuery(document).ready(function () {
    sticky_header();
});

jQuery(window).scroll(function () {
    sticky_header();
});
jQuery(window).resize(function () {
    sticky_header();
});

/* =====================================================
                    Active Section
===================================================== */

$(function () {
    var sid = "#" + $("section").attr("id") + "1";
    $(sid).addClass("active-section");
});

/* =====================================================
                        User Menu
===================================================== */

{
    var target = "";

    $(function () {

        $(".user-menu").click(function () {

            var target1 = $(this).attr("target");
            $(target1).toggle();
            if (target1 != target) {
                $(target).hide();
            }
            target = target1;

        });
    });
}

/* =====================================================
                    Thank You Popup
===================================================== */

function RequestBtn(id) {
    if (confirm('Are you sure you want to download this Paid note. Please confirm.')) {
        $.ajax({
            url: "/Home/NoteRequest/" + id,
            method: "POST",
            data: id,
            success: function () {
                $("#thank-you-popup").show();
            }
        })
    }
}

$(function () {

    $("#close-btn").click(function () {
        $("#thank-you-popup").hide();
    });

});

/* =====================================================
                    Download Popup
===================================================== */
var target = "";

function downloadPopup(target1) {
    console.log(target1);
    $(target1).toggle();

    if (target1 != target) {
        $(target).hide();
    }
    target = target1;
}
    
/* =====================================================
                        Add Review
===================================================== */

$(function () {

    $("#close-btn").click(function () {
        $("#add-review-bg").toggle();
    });

    $(".add-r-f").click(function () {
        $("#add-review-bg").toggle();
        $(target).hide();
    });

});


/* =====================================================
                            FAQ
===================================================== */

$(function () {
    $('.FAQ-pm img').click(function () {
        var a = $(this).attr("data-target");

        if ($(this).attr("src") == "/Images/minus.png") {
            $(this).attr("src", "/Images/plus.png");
            $(a).attr("class", "FAQ-box-add");
        } else {
            $(this).attr("src", "/Images/minus.png");
            $(a).removeAttr("class");
        }
    })
});

/* =====================================================
                    Remarks Popup
===================================================== */

$(function () {

    $(".reject-btn").click(function () {
        var target1 = $(this).attr("target");
        $(target1).show();
    });

    $(".unpublish").click(function () {
        var target1 = $(this).attr("target");
        $(target1).show();
    });


    $("#close-btn").click(function () {
        $("#add-review-bg").hide();
    });
});

/* =====================================================
                    Search Bar
===================================================== */

$(function () {
    $("#search-input").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });

    $("#search-input1").keydown(function () {
        $('.search-icon img').attr('src', "");
        $(this).attr('placeholder', "");
    });
});


function myFunction() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("search-input");
    filter = input.value.toUpperCase();
    table = document.getElementById("pager");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

function myFunction1() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("search-input1");
    filter = input.value.toUpperCase();
    table = document.getElementById("pager1");
    tr = table.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[0];
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

//function SearchFun() {
//    var input, filter, ul, li, a, i, txtValue;
//    input = document.getElementById("search-input");
//    filter = input.value.toUpperCase();
//    ul = document.getElementById("pager");
//    li = ul.getElementsByTagName("td");
//    for (i = 0; i < li.length; i++) {
//        a = li[i].getElementsByTagName("a")[0];
//        txtValue = a.textContent || a.innerText;
//        if (txtValue.toUpperCase().indexOf(filter) > -1) {
//            li[i].style.display = "";
//        } else {
//            li[i].style.display = "none";
//        }
//    }
//}

/* =====================================================
                    Table Sorter
===================================================== */

function funTableSorter() {
    $(".sort-table").tablesorter();
}

